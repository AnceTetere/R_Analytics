library(XLConnect)

setwd('F:\\PĀRRĒĶINS\\Dati')
wb <- loadWorkbook("SEKT_953_22c4.xlsx",
                   create = FALSE,
                   password = NULL)
setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "SEKT_953_2803_1510")
rm(wb)

NTABL953_sPUB_avg <- worksheet[worksheet$NSV == "023" & worksheet$NTABL == 953, c("NSV", "NTABL", "NOZARE2", "Nos_noz", "G5" )] 
NTABL953_sPRIV_avg <- worksheet[worksheet$NSV == "024" & worksheet$NTABL == 953, c("NSV", "NTABL", "NOZARE2", "Nos_noz", "G5" )]
rm(worksheet)
