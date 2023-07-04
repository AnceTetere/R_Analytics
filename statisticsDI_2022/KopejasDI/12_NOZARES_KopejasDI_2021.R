setwd('F:\\Dati')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_21.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "NOZ_SEKT_21_1605_1801")
rm(wb)

ntabl327_2021 <- worksheet[worksheet$NSV == "001" & worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet) 

source("F:\\nozares_vektors.R")

ntabl327_2021$NOZARE2[(ntabl327_2021$NOZARE2 %in% nozares) == FALSE]
NOZARES_KopejasDI_2021 <- ntabl327_2021[ntabl327_2021$NOZARE2 %in% nozares, ]
rm(ntabl327_2021)

NOZARES_KopejasDI_2021 <- NOZARES_KopejasDI_2021[order(match(NOZARES_KopejasDI_2021$NOZARE2, nozares)), ]
rm(nozares)
rownames(NOZARES_KopejasDI_2021) <- NULL
colnames(NOZARES_KopejasDI_2021)[colnames(NOZARES_KopejasDI_2021) == "G5"] <- "2021: G5"
