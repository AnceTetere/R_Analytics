setwd('F:\\Dati')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_20.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <-
  readWorksheet(wb, sheet = "NOZ_SEKT_20_1605_18")
rm(wb)

PUB_ntabl327_2020 <-
  worksheet[worksheet$NSV == "023" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

paste(
  "Sabiedriskajā sektorā kopējās darbaspēka izmaksas Latvijā 2020. gadā:",
  sprintf("%.1f", round(PUB_ntabl327_2020$G5[PUB_ntabl327_2020$NOZARE2 == "TOTAL"] / 1000000, 1)),
  "miljoni euro."
) 

#install.packages("Rmpfr")
library(Rmpfr)

PUB_KopejasDI_2020 <-
  mpfr(PUB_ntabl327_2020$G5[PUB_ntabl327_2020$NOZARE2 == "TOTAL"], precBits = 64)
rm(PUB_ntabl327_2020)
