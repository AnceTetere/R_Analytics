setwd('F:\\Dati\\2019')

library(XLConnect)
wb <- loadWorkbook("NOZ_19.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Users\\atetere\\Documents')
worksheet <- readWorksheet(wb, sheet = "NOZ_19")
rm(wb)

ntabl327_2019 <- worksheet[worksheet$NSV == "001" & worksheet$NTABL == "327", c("NSV", "DATE", "NTABL", "NOZARE2", "G5")]
rm(worksheet)

source("F:\\nozares_vektors.R")
nozares[nozares == "TOTAL"] <- "0"

ntabl327_2019$NOZARE2[(ntabl327_2019$NOZARE2 %in% nozares) == FALSE]
NOZARES_KopejasDI_2019 <- ntabl327_2019[ntabl327_2019$NOZARE2 %in% nozares, ]
rm(ntabl327_2019)

NOZARES_KopejasDI_2019 <- NOZARES_KopejasDI_2019[order(match(NOZARES_KopejasDI_2019$NOZARE2, nozares)), ]
rm(nozares)

rownames(NOZARES_KopejasDI_2019) <- NULL
colnames(NOZARES_KopejasDI_2019)[colnames(NOZARES_KopejasDI_2019) == "G5"] <- "2019: G5"
NOZARES_KopejasDI_2019$NOZARE2[NOZARES_KopejasDI_2019$NOZARE2 == "0"] <- "TOTAL"
