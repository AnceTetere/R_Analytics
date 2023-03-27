install.packages("XLConnect")
library(XLConnect)

getwd()

wb <- loadWorkbook("file.xlsx", create = TRUE)

