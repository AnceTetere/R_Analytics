#1. Gada šablonu
year <- as.character(as.numeric(format(Sys.Date(), "%Y")) - 1)
path <- paste0("F://DP//VFD//gada//", year, "//project_code")

setwd(paste0(path, "//template"))
load(paste0("VFDtemplate_", year, ".RData"))
ailes_VFDtemplate <- colnames(VFDtemplate)
setwd(path)

#2. 51. k-dati

library(XLConnect)
setwd(paste0(path, "//noSMUD"))

wb <- loadWorkbook(paste0(year, "_k_51.xlsx"))
sheetName <- paste0(year, "_k_51")
setwd(path)

ws <- readWorksheet(wb, sheet = sheetName)
rm(wb, sheetName)

#----------šablona līniju skaitu pielīdzinu sarakstam---------

VFDintm_1 <- VFDtemplate[1:nrow(ws), ]     
rm(VFDtemplate) 

# starpposmu tabulas lieka mapē 'intermediateTables'
setwd(paste0(path, "//intermediateTables"))
fileName <- paste0("1_VFDintm_", year, ".RData")
save(VFDintm_1, file = fileName)

rm(fileName)
setwd(path)

#---------nolieku .RData formātā malā tabulu GGGG_k51saraksts

setwd(paste0(path, "//noSMUD"))
k51saraksts <- ws
fileName <- paste0(year, "_", "k51saraksts.RData")
save(k51saraksts, file = fileName)

rm(fileName, ws)
setwd(path)
