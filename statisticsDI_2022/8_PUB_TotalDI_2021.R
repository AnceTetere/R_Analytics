setwd('F:\\Dati')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_21.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Users\\atetere\\Documents')
worksheet <-
  readWorksheet(wb, sheet = "NOZ_SEKT_21_1605_1801")
rm(wb)

PUB_ntabl327_2021 <-
  worksheet[worksheet$NSV == "023" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

paste(
  "Sabiedriskajā sektorā kopējās darbaspēka izmaksas Latvijā 2021. gadā:",
  sprintf("%.1f", round(PUB_ntabl327_2021$G5[PUB_ntabl327_2021$NOZARE2 == "TOTAL"] / 1000000, 1)),
  "miljoni euro."
) 

#install.packages("Rmpfr")
library(Rmpfr)

PUB_KopejasDI_2021 <-
  mpfr(PUB_ntabl327_2021$G5[PUB_ntabl327_2021$NOZARE2 == "TOTAL"], precBits = 64)
rm(PUB_ntabl327_2021)
