setwd('F:\\Dati')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_20.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "NOZ_SEKT_20_1605_1528")
rm(wb)

ntabl327_2020 <- worksheet[worksheet$NSV == "001" & worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet) 

source("F:\\nozares_vektors.R")

ntabl327_2020$NOZARE2[(ntabl327_2020$NOZARE2 %in% nozares) == FALSE]
NOZARES_KopejasDI_2020 <- ntabl327_2020[ntabl327_2020$NOZARE2 %in% nozares, ]
rm(ntabl327_2020)

NOZARES_KopejasDI_2020 <- NOZARES_KopejasDI_2020[order(match(NOZARES_KopejasDI_2020$NOZARE2, nozares)), ]
rm(nozares)
rownames(NOZARES_KopejasDI_2020) <- NULL
colnames(NOZARES_KopejasDI_2020)[colnames(NOZARES_KopejasDI_2020) == "G5"] <- "2020: G5"
