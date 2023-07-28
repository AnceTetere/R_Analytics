setwd('F:\\DatiSMUD')

library(XLConnect)
wb <- loadWorkbook("NOZ_SEKT_20.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <-
  readWorksheet(wb, sheet = "NOZ_SEKT_20_1605_1528")
rm(wb)

PRIV_ntabl327_2020 <-
  worksheet[worksheet$NSV == "024" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

paste(
  "Privātajā sektorā kopējās darbaspēka izmaksas Latvijā 2020. gadā:",
  sprintf("%.1f", round(PRIV_ntabl327_2020$G5[PRIV_ntabl327_2020$NOZARE2 == "TOTAL"] / 1000000, 1)),
  "miljoni euro."
)

#install.packages("Rmpfr")
library(Rmpfr)

PRIV_KopejasDI_2020 <-
  mpfr(PRIV_ntabl327_2020$G5[PRIV_ntabl327_2020$NOZARE2 == "TOTAL"], precBits = 64)
rm(PRIV_ntabl327_2020)
