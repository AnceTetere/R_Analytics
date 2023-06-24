setwd('F:\\Dati')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_21.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <-
  readWorksheet(wb, sheet = "NOZ_SEKT_21_1605_18")
rm(wb)

PRIV_ntabl327_2021 <-
  worksheet[worksheet$NSV == "024" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

paste(
  "Privātajā sektorā kopējās darbaspēka izmaksas Latvijā 2021. gadā:",
  sprintf("%.1f", round(PRIV_ntabl327_2021$G5[PRIV_ntabl327_2021$NOZARE2 == "TOTAL"] / 1000000, 1)),
  "miljoni euro."
) 

#install.packages("Rmpfr")
library(Rmpfr)

PRIV_KopejasDI_2021 <-
  mpfr(PRIV_ntabl327_2021$G5[PRIV_ntabl327_2021$NOZARE2 == "TOTAL"], precBits = 64) 
rm(PRIV_ntabl327_2021)
