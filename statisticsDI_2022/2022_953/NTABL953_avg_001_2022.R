library(XLConnect)

setwd('F:\\PĀRRĒĶINS\\Dati')
wb <- loadWorkbook("Noz22_1_322_327_953.xlsx",
                   create = FALSE,
                   password = NULL)
setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "Noz22_1_322_327_953") 
rm(wb)  

NTABL953_avg_001_2022 <- worksheet[worksheet$NTABL == 953, c("NSV", "NTABL", "NOZARE2", "Nos_noz", "G5" )] #23
rm(worksheet)
