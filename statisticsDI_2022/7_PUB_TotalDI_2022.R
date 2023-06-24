setwd('F:\\PĀRRĒĶINS\\Dati')

library(XLConnect)
wb <- loadWorkbook("SEKT_22.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Documents')
worksheet <- readWorksheet(wb, sheet = "SEKT_22")
rm(wb)

PUB_ntabl327_2022 <-
  worksheet[worksheet$NSV == "023" &
              worksheet$NTABL == "327", c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5")]
rm(worksheet)

print(
  paste(
    "Sabiedriskajā sektorā kopējās darbaspēka izmaksas Latvijā 2022. gadā:",
    sprintf("%.1f", round(PUB_ntabl327_2022$G5[PUB_ntabl327_2022$NOZARE2 == "TOTAL"] / 1000000, 1)),
    "miljoni euro."
  )
) 

#install.packages("Rmpfr")
library(Rmpfr)

PUB_KopejasDI_2022 <-
  mpfr(PUB_ntabl327_2022$G5[PUB_ntabl327_2022$NOZARE2 == "TOTAL"], precBits = 64)
rm(PUB_ntabl327_2022)
