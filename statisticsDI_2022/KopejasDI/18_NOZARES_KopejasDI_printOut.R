# Let's do a printout of this table
source("F:\\23_NOZARES_KopejasDI_formatted.R")

write.table(NOZARES_KopejasDI_formatted, "NOZARES_KopejasDI_formatedValues.csv", sep = ";", col.names = TRUE, row.names = FALSE, qmethod = "double")
rm(NOZARES_KopejasDI)
