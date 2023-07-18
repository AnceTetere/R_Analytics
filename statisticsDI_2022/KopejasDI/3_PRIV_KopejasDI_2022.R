setwd('F:\\DatiSMUD')

library(XLConnect)
wb <- loadWorkbook("SEKT_22.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "SEKT")
rm(wb)

PRIV_ntabl327_2022 <-
  worksheet[worksheet$NSV == "024" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

print(
  paste(
    "Privātajā sektorā kopējās darbaspēka izmaksas Latvijā 2022. gadā:",
    sprintf("%.1f", round(PRIV_ntabl327_2022$G5[PRIV_ntabl327_2022$NOZARE2 == "TOTAL"] / 1000000, 1)),
    "miljoni euro."
  )
) 

#install.packages("Rmpfr")
library(Rmpfr)

PRIV_KopejasDI_2022 <-
  mpfr(PRIV_ntabl327_2022$G5[PRIV_ntabl327_2022$NOZARE2 == "TOTAL"], precBits = 64)
rm(PRIV_ntabl327_2022)
