source("F:\\REGIONS_GROUPS_ntabl953_001_2021.R")

REGIONS_GROUPS_ntabl953_001_2021$`mikro_1–9` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2021$`mikro_1–9`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2021$`mazie_10–49` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2021$`mazie_10–49`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2021$`vidējie_50–249` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2021$`vidējie_50–249`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2021$`lielie_250+` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2021$`lielie_250+`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2021$VISS <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2021$VISS/1000, 2))

REGIONS_GR953_2021_formatted <- REGIONS_GROUPS_ntabl953_001_2021
rm(REGIONS_GROUPS_ntabl953_001_2021)

setwd("F:\\Izstrades_printOut")
write.table(REGIONS_GR953_2021_formatted, "DI_infoApskats_tab1_2_REGIONS_GROUPS_ntabl953_001_2021.csv", 
            sep = ";", col.names = TRUE, row.names = FALSE, qmethod = "double")
rm(REGIONS_GR953_2021_formatted)
