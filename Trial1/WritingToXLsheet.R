install.packages("XLConnect")
library(XLConnect)

getwd()
setwd("D:\\R-PROGRAMMING\\R-Analytics\\Trial1")

# Create a new document 
wb <- loadWorkbook("file.xlsx", create = TRUE)
createSheet(wb, "Sheet1")

# Or open an existing document
loadWorkbook(filename, create = FALSE, password = NULL)
wb.mtcars <- loadWorkbook(system.file("demoFiles/mtcars.xlsx", 
                                      package = "XLConnect"))

writeWorksheet(object = wb, data = stats, sheet = "Sheet1", 
               startRow = 1, startCol = 1, header = TRUE)



wb1 <- writeWorksheetToFile("file.xlsx", data = stats, sheet = "Sheet 1",
                     startRow = 1, startCol = 1)

saveWorkbook(wb1) # Saves the work under the title 'file.xlsx' 
                 ##                   in a working directory

# clean up 
file.remove("file.xlsx")

# More info
vignette("XLConnect")

