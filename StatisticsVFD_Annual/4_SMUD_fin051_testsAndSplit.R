#1. Paņem k51dati

library(XLConnect)
setwd(paste0(path, "//noSMUD"))

wb <- loadWorkbook(paste0(year, "_F051.xlsx"))
sheetName <- paste0(year, "_F051")
setwd(path)

F051 <- readWorksheet(wb, sheet = sheetName)
F051$NTABL <- factor(F051$NTABL)
tabulas <- levels(F051$NTABL)

rm(wb, sheetName)

#-------------TEST I: Vai visas ISK ailes nes vienādus kodus.
ws <- F051
if((sum(ws$ISK1 == ws$ISK2) == sum(ws$ISK2 == ws$ISK3)) == (sum(ws$ISK2 == ws$ISK3) == sum(ws$ISK3 == ws$ISK4))) {
  cat("\33[34m", "ISK pārbaude izieta: Visas ISK ailes nes vienādus kodus.", "\33[0m\n")
} else {
  cat("\033[31m", "ISK pārbaude NAV izieta: ISK kodi atšķiras. \n
      Meklē kļūdu.", "\33[0m\n")
}

#2. Sagriez datni
darba_ailes <- c("id", "UUK", "NMK", "DAT", "NSV", "NTABL", "NACE7KAT", "NOS", "NACE71", "G0", "G1", "G2", "G3", "G4", "G5")
ws <- ws[order(ws$UUK), darba_ailes]

ws_split <- split(ws, ws$NTABL)
new_names <- paste0("T", tabulas, "_", substr(year, 3, 4))
names(ws_split) <- new_names
list2env(ws_split, envir = .GlobalEnv)

rm(ws_split, tabulas)
new_tables <- new_names

#------------------TEST II: Vai visām atvasinātajām tabulām ir vienāds rindu skaits un neiztrūkst vērtības.
library("dplyr")

row_counts <- sapply(new_tables, function(table_name) {
  table <- get(table_name)
  nrow(table)
})

all_same_row_count <- all(row_counts == row_counts[1])

if (all_same_row_count) {
  cat("\33[34m", "Visām tabulām ir vienāds rindu skaits:", row_counts[1], "rindas. \n 
      PĀRBAUDE IZIETA.", "\033[0m\n")
} else {
  cat("\033[31m", "UZMANĪBU, rindu skaits tabulās atšķiras: ", row_counts, " rindas katrā. \n
      PĀRBAUDE NAV IZIETA. \n")
}
rm(row_counts, table, table_name, all_same_row_count)

#-------------------TEST III: Vai visas atvasinātās tabulas satur tās tabulas datus, kas uzrādās tās nosaukumā.
test <- TRUE
ntabl_list <- list()

for (table_name in new_tables) {
  table <- get(table_name)
  test <- test & sum(table$NTABL == as.integer(substr(table_name, 2, 4))) == nrow(table)
}

if (test) {
  cat("\33[34m", "Katra atvasinātā tabula satur tās nosaukumā norādīto tabulu. \n
      PĀRBAUDE IZIETA.", "\33[0m\n")
} else {
  cat("\033[31m", "Kādā no atvasinātajām datnēm, nesatur tās nosaukumā uzrādīto tabulu.\n
    PĀRBAUDE NAV IZIETA: meklēt kļūdu.", "\033[0m\n")
}
rm(test, new_names, table, ntabl_list, table_name)

#--------------------TEST IV: Vai atvasinātajās tabulās norādītais gads datiem sakrīt ar gadu priekš VFD.
test <- TRUE
DAT_list <- list()

for (table_name in new_tables){
  table <- get(table_name)
  test <- test & sum(substr(table$DAT, 3, 4) == substr(year, 3, 4)) == nrow(table)
}

if(test) {
  cat("\33[34m", "Atvasinātajās tabulās norādītais gads sakrīt ar gadu, par kuru tiek veidots dokuments priekš VFD. \n
      PĀRBAUDE IZIETA", "\033[0m\n")
} else {
  cat("\33[31m", "Kādā no atvasinātajām tabulām datums atšķiras no tā, par kuru tiek veidots šis dokuments priekš VFD.\n
      PARBAUDE NAV IZIETA: meklē kļūdu.", "\033[31m")
}
rm(table_name, table, DAT_list, test)

#--------------------TEST V: Vai k51dati U-kodi sakrīt ar k51saraksts kodiem.
# Tas attiecīgi pārbauda arī vai to skaits sakrīt.

setwd(paste0(path, "//noSMUD"))
load(paste0(year, "_k51saraksts.RData"))
setwd(path)

k51 <- k51saraksts
rm(k51saraksts)

test <- TRUE

for(table_name in new_tables) {
  table <- get(table_name)
  test <- test & sum(order(table$UUK) == order(k51$UUK))
}

if(test) {
  cat("\33[34m", "Datnē", paste0(year, "_F051"), "k51dati kodi sakrīt ar kodiem k51sarakstā",
      paste0(year, "_k51saraksts."), 
      "\n PĀRBAUDE IZIETA.", "\33[0m\n")
} else {
  cat("\33[31m", "Datnē", paste0(year, "_F051"), "k51dati kodi NESAKRĪT ar k51saraksts kodiem",
      paste0(year, "_k51saraksts."),
      "\n PĀRBAUDE NAV IZIETA: Meklē nesakritības.", "\33[0m\n")
}

rm(table_name, test, k51, table)

#4. SMUD mape

setwd(paste0(path, "//noSMUD"))
fileName <- paste0(year, "_F051.RData")
save(F051, file = fileName)

rm(fileName, F051)

#5. Starpposmu datnes

setwd(paste0(path, "//intermediateTables"))
numbers <- c(3:(length(new_tables)+2))

for (i in 1:length(new_tables)) {
  table <- get(new_tables[i])
  fileName <- paste0(numbers[i], "_", substr(new_tables[i], 1, 4), "k51_", year, ".RData")
  save(table, file = fileName)
}

rm(fileName, i, numbers, table)

for(table in new_tables) {
  rm(list = table, envir = .GlobalEnv)
}

tables_51kpsv <- new_tables
rm(new_tables, ws, i, table)
