setwd('F:\\Dati')
library(XLConnect)
wb <- loadWorkbook("Noz22_1_322_327_953.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "Noz22_1_322_327_953")
rm(wb)

source("F:\\nozares_vektors.R")

ntabl327_2022 <- worksheet[worksheet$NSV == "001" & worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")] 
rm(worksheet) 

ntabl327_2022$NOZARE2[(ntabl327_2022$NOZARE2 %in% nozares) == FALSE]
NOZARES_KopejasDI_2022 <- ntabl327_2022[ntabl327_2022$NOZARE2 %in% nozares, ]
rm(ntabl327_2022)

NOZARES_KopejasDI_2022 <- NOZARES_KopejasDI_2022[order(match(NOZARES_KopejasDI_2022$NOZARE2, nozares)), ]
rm(nozares)
rownames(NOZARES_KopejasDI_2022) <- NULL
colnames(NOZARES_KopejasDI_2022)[colnames(NOZARES_KopejasDI_2022) == "G5"] <- "2022: G5"
