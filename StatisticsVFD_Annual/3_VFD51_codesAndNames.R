setwd(paste0(path, "//noSMUD"))
load(paste0(year, "_k51saraksts.RData"))
setwd(path)

# Šo failu lieto tikai datu ātrākai ielādei R, bet pašu datni nemaina.
ws <- k51saraksts
rm(k51saraksts)

#3. Pārbaude k51
sum(ws$ISK1 != ws$ISK2) == sum(ws$ISK2 != ws$ISK3) #TRUE
ws <- ws[order(ws$UUK), ]

#4. Ievieto kodus

VFDintm_1$UUK <- ws$UUK
VFDintm_1$Nos <- ws$NOS
VFDintm_1$ISK <- ws$ISK1
VFDintm_1$nace2red <- ws$NACE71
VFDintm_1$SVTK <- ws$IUFIK

#5. Saglabā

VFDintm_2 <- VFDintm_1    
rm(VFDintm_1) 

setwd(paste0(path, "//intermediateTables"))
fileName <- paste0("2_VFDintm_", year, ".RData")
save(VFDintm_2, file = fileName)

rm(fileName)
setwd(path)
