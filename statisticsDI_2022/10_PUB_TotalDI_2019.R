setwd('F:\\Dati\\2019')

library(XLConnect)
wb <- loadWorkbook("SEKT_19.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "SEKT_19") 
rm(wb)

PUB_ntabl327_2019 <-
  worksheet[worksheet$NSV == "023" &
              worksheet$NTABL == "327", c("NSV", "DATE", "NTABL", "NOZARE2", "G5")]
rm(worksheet)

paste(
  "Sabiedriskajā sektorā kopējās darbaspēka izmaksas Latvijā 2019. gadā:",
  sprintf("%.1f", round(PUB_ntabl327_2019$G5[PUB_ntabl327_2019$NOZARE2 == "0"] / 1000000, 1)),
  "miljoni euro."
)

#install.packages("Rmpfr")
library(Rmpfr)

PUB_KopejasDI_2019 <-
  mpfr(PUB_ntabl327_2019$G5[PUB_ntabl327_2019$NOZARE2 == "0"], precBits = 64) 
rm(PUB_ntabl327_2019)
