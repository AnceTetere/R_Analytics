# pārrēķinām procentuālās izmaiņas
source("F:\\REGIONS_GROUPS_ntabl953_001_2022.R")
source("F:\\REGIONS_GROUPS_ntabl953_001_2021.R")

REGIONS_GROUPS_ntabl953_001_2022$Nos[(REGIONS_GROUPS_ntabl953_001_2022$VISS - REGIONS_GROUPS_ntabl953_001_2021$VISS) < 0]

onlyREGIONS_GROUPS_ntabl953_001_2022 <- REGIONS_GROUPS_ntabl953_001_2022[-1, ]
onlyREG_2021 <- REGIONS_GROUPS_ntabl953_001_2021[-1, ]

paste(onlyREGIONS_GROUPS_ntabl953_001_2022$Nos[onlyREGIONS_GROUPS_ntabl953_001_2022$VISS == max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS)],
      "kurā koncentrējas",
      sprintf("%.1f", round(REGIONS_GROUPS_ntabl953_001_2022$VISS[REGIONS_GROUPS_ntabl953_001_2022$Nos == onlyREGIONS_GROUPS_ntabl953_001_2022$Nos[onlyREGIONS_GROUPS_ntabl953_001_2022$VISS == max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS)]] /REGIONS_GROUPS_ntabl953_001_2021$VISS[REGIONS_GROUPS_ntabl953_001_2022$Nos == "LATVIJA"] * 100, 1), "(", sprintf("%.1f", round(max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS)/1000, 1)), "tūkst.) no visām darbvietām valstī, aizņemto darbvietu skaits palielinājās par", sprintf("%.1f", round(max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS) / onlyREG_2021$VISS[onlyREG_2021$Nos == onlyREGIONS_GROUPS_ntabl953_001_2022$Nos[onlyREGIONS_GROUPS_ntabl953_001_2022$VISS == max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS)]] * 100 - 100, 1))),
      "% (",
      sprintf("%.1f", round(max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS/1000), 1)),
      "tūkst.) no visām darbvietām valstī, aizņemto darbvietu skaits palielinājās par ",
      sprintf("%.1f", round(max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS) / onlyREG_2021$VISS[onlyREG_2021$Nos == onlyREGIONS_GROUPS_ntabl953_001_2022$Nos[onlyREGIONS_GROUPS_ntabl953_001_2022$VISS == max(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS)]] * 100 - 100, 1)),
      "%.")
  

onlyREGIONS_GROUPS_ntabl953_001_2022 <- onlyREGIONS_GROUPS_ntabl953_001_2022[order(onlyREGIONS_GROUPS_ntabl953_001_2022$VISS, decreasing = TRUE),]
colnames(onlyREGIONS_GROUPS_ntabl953_001_2022)[colnames(onlyREGIONS_GROUPS_ntabl953_001_2022) == "VISS"] <- "VISS_2022"
colnames(onlyREG_2021)[colnames(onlyREG_2021) == "VISS"] <- "VISS_2021"

onlyREG <- merge(onlyREGIONS_GROUPS_ntabl953_001_2022[,c("Nos", "VISS_2022")], onlyREG_2021[,c("Nos", "VISS_2021")], by.x = "Nos", by.y = "Nos")
onlyREG$change2022vs2021 <- onlyREG$VISS_2022 - onlyREG$VISS_2021 
onlyREG$percentChange_2022vs2021 <- onlyREG$VISS_2022 / onlyREG$VISS_2021 * 100 - 100 

onlyREG <- onlyREG[!(onlyREG$VISS_2022 == max(onlyREG$VISS_2022)), ]
onlyREG <- onlyREG[order(onlyREG$change2022vs2021, decreasing = TRUE), ]
rownames(onlyREG) <- NULL

paste(onlyREG$Nos[1],
"darbvietu skaits 2022. gada laikā palielinājās par",
sprintf("%.1f", round(onlyREG$change2022vs2021[1]/1000, 1)),
"tūkst. jeb",
sprintf("%.1f", round(onlyREG$percentChange_2022vs2021[1], 1)),
"%,",

onlyREG$Nos[2],
"- par",
sprintf("%.1f", round(onlyREG$change2022vs2021[2]/1000, 1)),
"tūkst. jeb",
sprintf("%.1f", round(onlyREG$percentChange_2022vs2021[2], 1)),
"% un",

onlyREG$Nos[3],
"- par",
sprintf("%.1f", round(onlyREG$change2022vs2021[3]/1000, 1)),
"tūkst. jeb",
sprintf("%.1f", round(onlyREG$percentChange_2022vs2021[3], 1)),
"%.",

onlyREG$Nos[4],
"- par",
sprintf("%.1f", round(onlyREG$change2022vs2021[4]/1000, 1)),
"tūkst. jeb",
sprintf("%.1f", round(onlyREG$percentChange_2022vs2021[4], 1)),
"%."
)

rm(onlyREG, onlyREG_2021, onlyREGIONS_GROUPS_ntabl953_001_2022, REGIONS_GROUPS_ntabl953_001_2021, REGIONS_GROUPS_ntabl953_001_2022)
