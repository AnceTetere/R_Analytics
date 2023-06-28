library(XLConnect)

setwd('F:\\Dati\\2021')
wb <- loadWorkbook("N21_953.xlsx",
                   create = FALSE,
                   password = NULL)
setwd('C:\\Users\\atetere\\Documents')
worksheet <- readWorksheet(wb, sheet = "N_21") # 69
rm(wb)

NTABL953_avg_2021 <- worksheet[worksheet$NTABL == 953, c("NSV", "DAT", "NTABL", "NOZARE2", "Nos_noz", "G5" )] 
rm(worksheet)

NTABL953_avg_2021$NSV <- factor(NTABL953_avg_2021$NSV)
levels(NTABL953_avg_2021$NSV)

# Split the data frame into a list of data frames by factor levels
NTABL953_avg_2021_kopsavilkumi <- split(NTABL953_avg_2021, NTABL953_avg_2021$NSV)
names(NTABL953_avg_2021_kopsavilkumi)[names(NTABL953_avg_2021_kopsavilkumi) == "001"] <- "NTABL953_avg_001_2021"
names(NTABL953_avg_2021_kopsavilkumi)[names(NTABL953_avg_2021_kopsavilkumi) == "023"] <- "NTABL953_avg_023_2021"
names(NTABL953_avg_2021_kopsavilkumi)[names(NTABL953_avg_2021_kopsavilkumi) == "024"] <- "NTABL953_avg_024_2021"
list2env(NTABL953_avg_2021_kopsavilkumi, envir = .GlobalEnv)
rm(NTABL953_avg_2021_kopsavilkumi, NTABL953_avg_2021)
