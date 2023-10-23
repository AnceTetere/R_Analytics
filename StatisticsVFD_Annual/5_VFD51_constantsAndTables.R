tab_vec <- c("141", "307", "321", "322", "323", "324", "361")

#1. Paņem VFD šablonu...
setwd(paste0(path, "//intermediateTables"))
load(paste0("2_VFDintm_", year, ".RData"))
wd <- VFDintm_2
rm(VFDintm_2)

#... un sagriez to
#2. Izņem konstantes
VFDintm_const <- wd[ , c("UUK", "Nos", "ISK", "nace2red", "SVTK")]
fileName <- paste0("10_VFDintm_const_", year, ".RData")
save(VFDintm_const, file = fileName)
rm(fileName, VFDintm_const)

sum(wd$UUK == wd[order(wd$UUK), "UUK"]) == nrow(wd)

#3. izņem tabulas

fileNr <- c(11 : (10+length(tab_vec)))
test_sum <- TRUE

for (i in 1:length(tab_vec)) {
tabTemplate <- paste0("VFDintm_t", tab_vec[i])
ws <- wd[ , c("UUK", paste0(year, "Q1_T", tab_vec[i]), paste0(year, "Q2_T", tab_vec[i]), paste0(year, "Q3_T", tab_vec[i]), 
        paste0(year, "Q4_T", tab_vec[i]), paste0(year, "_TOTAL_T", tab_vec[i]))] 
assign(tabTemplate, ws)
test_sum == (substr(colnames(ws)[2:ncol(ws)], nchar(colnames(ws)[2:ncol(ws)])-2, nchar(colnames(ws)[2:ncol(ws)])) == tab_vec[i])

fileName <- paste0(fileNr[i], "_VFDintm_t", tab_vec[i], "_", year, ".RData")
save(tabTemplate, file = fileName)

rm(list = tabTemplate, envir = .GlobalEnv)
rm(tabTemplate, ws, fileName)
}

if(test_sum) {
  cat("\33[34m", "Tabulas nosaukumi sakrīt ar ailēs norādītajām tabulām.\n PĀRBAUDE IZIETA.", "\33[0m\n")
} else {
  cat("\33[31m", "Tabulu ailēs uzrādītie tabulas numuri nesakrīt ar tabulas nosaukumā norādīto.\n PĀRBAUDE NAV IZIETA.", "\33[0m\n")
}

setwd(path)
rm(wd, i, test_sum, fileNr)
