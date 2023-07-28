setwd('F:\\2019')

library(XLConnect)
wb <- loadWorkbook("SEKT_19.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "SEKT_19")
rm(wb)

PRIV_ntabl327_2019 <-
  worksheet[worksheet$NSV == "024" &
              worksheet$NTABL == "327", c("NSV", "DATE", "NTABL", "NOZARE2", "G5")]
rm(worksheet)

paste(
  "Privātajā sektorā kopējās darbaspēka izmaksas Latvijā 2019. gadā:",
  sprintf("%.1f", round(PRIV_ntabl327_2019$G5[PRIV_ntabl327_2019$NOZARE2 == "0"] / 1000000, 1)),
  "miljoni euro."
) 

#install.packages("Rmpfr")
library(Rmpfr)

PRIV_KopejasDI_2019 <-
  mpfr(PRIV_ntabl327_2019$G5[PRIV_ntabl327_2019$NOZARE2 == "0"], precBits = 64) 
rm(PRIV_ntabl327_2019)
