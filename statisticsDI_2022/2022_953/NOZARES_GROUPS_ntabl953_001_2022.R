#1 paņemam datus
library(XLConnect)

setwd('F:\\Pārrēķins\\Dati')
wb <- loadWorkbook("GR2_22_953.xlsx",
                   create = FALSE,
                   password = NULL)
setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "GR2_22_953")
rm(wb)

source("F:\\R_kods\\nozares_vektors.R")

NOZARES_GROUPS_ntabl953_001_2022 <- worksheet[worksheet$NOZARE2 %in% nozares, c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5", "lielums", "GRUPA")]
rownames(NOZARES_GROUPS_ntabl953_001_2022) <- NULL #80
rm(worksheet)

#2 sadalām grupas
NOZARES_GROUPS_ntabl953_001_2022$GRUPA <- factor(NOZARES_GROUPS_ntabl953_001_2022$GRUPA)
levels(NOZARES_GROUPS_ntabl953_001_2022$GRUPA)

#NOZARES_GROUPS_ntabl953_001_2022 <- split(NOZARES_GROUPS_ntabl953_001_2022, NOZARES_GROUPS_ntabl953_001_2022$GRUPA)
#names(NOZARES_GROUPS_ntabl953_001_2022)[names(NOZARES_GROUPS_ntabl953_001_2022) == "1"] <- "mikro_2022"
#names(NOZARES_GROUPS_ntabl953_001_2022)[names(NOZARES_GROUPS_ntabl953_001_2022) == "2"] <- "mazie_2022"
#names(NOZARES_GROUPS_ntabl953_001_2022)[names(NOZARES_GROUPS_ntabl953_001_2022) == "3"] <- "vidējie_2022"
#names(NOZARES_GROUPS_ntabl953_001_2022)[names(NOZARES_GROUPS_ntabl953_001_2022) == "7"] <- "lielie_2022"
#names(NOZARES_GROUPS_ntabl953_001_2022)[names(NOZARES_GROUPS_ntabl953_001_2022) == "11"] <- "VISS_2022"
#list2env(NOZARES_GROUPS_ntabl953_001_2022, envir = .GlobalEnv)

#rm(NOZARES_GROUPS_ntabl953_001_2022)

#3 Savienojam tabulas

#colnames(`mikro_1–9`)[colnames(`mikro_1–9`) == "G5"] <- "mikro_1–9"
#NOZARES_GROUPS_ntabl953_001_2022 <- `mikro_1–9`[ , c("RAJ", "Nos", "mikro_1–9")]
#rownames(NOZARES_GROUPS_ntabl953_001_2022) <- NULL
#rm(`mikro_1–9`)

#colnames(`mazie_10–49`)[colnames(`mazie_10–49`) == "G5"] <- "mazie_10–49"
#mazie <- `mazie_10–49`[ , c("Nos", "mazie_10–49")]
#rownames(mazie) <- NULL
#rm(`mazie_10–49`)

#NOZARES_GROUPS_ntabl953_001_2022 <- merge(NOZARES_GROUPS_ntabl953_001_2022, mazie, by.x = "Nos", by.y = "Nos")
#rm(mazie)

#colnames(`vidējie_50–249`)[colnames(`vidējie_50–249`) == "G5"] <- "vidējie_50–249"
#videjie <- `vidējie_50–249`[ , c("Nos", "vidējie_50–249")]
#rownames(videjie) <- NULL
#rm(`vidējie_50–249`)

#NOZARES_GROUPS_ntabl953_001_2022 <- merge(NOZARES_GROUPS_ntabl953_001_2022, videjie, by.x = "Nos", by.y = "Nos")
#rm(videjie)

#colnames(`lielie_250+`)[colnames(`lielie_250+`) == "G5"] <- "lielie_250+"
#lielie <- `lielie_250+`[ , c("Nos", "lielie_250+")]
#rownames(lielie) <- NULL
#rm(`lielie_250+`)

#NOZARES_GROUPS_ntabl953_001_2022 <- merge(NOZARES_GROUPS_ntabl953_001_2022, lielie, by.x = "Nos", by.y = "Nos")
#rm(lielie)

#colnames(`VISS`)[colnames(`VISS`) == "G5"] <- "VISS"
#Viss <- `VISS`[ , c("Nos", "VISS")]
#rownames(Viss) <- NULL
#rm(`VISS`)

#NOZARES_GROUPS_ntabl953_001_2022 <- merge(NOZARES_GROUPS_ntabl953_001_2022, Viss, by.x = "Nos", by.y = "Nos")
#rm(Viss)

#4 Nokopies

#NOZARES_GROUPS_ntabl953_001_2022 <- NOZARES_GROUPS_ntabl953_001_2022[order(match(NOZARES_GROUPS_ntabl953_001_2022$Nos, regions)), ]
#rownames(NOZARES_GROUPS_ntabl953_001_2022) <- NULL

#5 pārbaude
#for (i in 3:7) {
#  a <-  sum(NOZARES_GROUPS_ntabl953_001_2022[-1, i])
#  b <- NOZARES_GROUPS_ntabl953_001_2022[1, i]
#  print(a==b || (abs(a) - abs(b)) <= 1)
#  rm(a, b)
#}
#rm(i, regions)
