install.packages("XLConnect")
library(XLConnect)

getwd()

wb <- loadWorkbook("file.xlsx", create = TRUE)
createSheet(wb, "Sheet1")

writeWorksheet(object = wb, data = stats, sheet = "Sheet1", 
               startRow = 1, startCol = 1, header = TRUE)

