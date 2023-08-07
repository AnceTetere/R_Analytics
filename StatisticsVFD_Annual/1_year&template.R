path <- "F://DP//VFD//gada"

#-----------------ATRODI GADU-------------
#1. Manuāli
year <- readline("Lūdzu, ievadīt gadu, par kuru tiek veidots VFD dokuments: ")
nchar(year) == 4


#2. Automātiski
# Atņemot no pašreizējā gada, jo pārskats parasti tiek veidots pa iepriekšējo gadu.
# ___________Uzmanīgi, ja dokuments tiek veidots par citu, ne iepriekšējo gadu._____

current_date <- Sys.Date()
year <- as.character(as.numeric(format(current_date, "%Y")) - 1)

if (nchar(year) == 4) {
  load(paste0(path, "//", year, "//project_code//template//startingTemplate_for_yearlyVFD.RData"))
  path <- paste0(path, "//", year, "//project_code")
  rm(current_date)
} else {
  print_in_red <- function(text) {
    cat("\033[1m\033[31m", text, "\033[0m\n")
  }
  print_in_red("Nepareizs gads! \n LŪDZU, IEVADĪT GADU, PAR KURU TIEK VEIDOTS DOKUMENTS")
  rm(print_in_red)
}

setwd(path)
getwd()

#-----------------NOFORMĒ ŠABLONU ATBILSTOŠI GADAM-------------

ws <- startingTemplate_for_yearlyVFD
rm(startingTemplate_for_yearlyVFD)

  ws[2, nchar(ws[2, ]) == 6] <- paste0(year, "Q", substr(ws[2, nchar(ws[2, ]) == 6], 1, 1))
  ws[2, nchar(ws[2, ]) > 6] <- paste0(year, "_TOTAL")

  ws[1, 6:ncol(ws)] <- paste0("_T", substr(ws[1, 6:ncol(ws)], 1, 1), substr(ws[1, 6:ncol(ws)], 3, 4))
  ws[1, ] <- paste0(ws[2, ], ws[1, ])
  
  colnames(ws) <- ws[1, ]
  ws <- ws[-(1:2), ]
  rownames(ws) <- NULL
  
  assign(paste0("VFDtemplate"), ws)
  rm(ws)
  
setwd(paste0(path, "//template"))
fileName <- paste0("VFDtemplate_", year, ".RData")
save(VFDtemplate, file = fileName)  

setwd(path)
rm(fileName)
