#!!!! Absolūtām vērtībām 2 cipari aiz decimālpunkta VIENMĒR
source("F:\\REGIONS_GROUPS_ntabl953_001_2022.R")

REGIONS_GROUPS_ntabl953_001_2022$`mikro_1–9` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2022$`mikro_1–9`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2022$`mazie_10–49` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2022$`mazie_10–49`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2022$`vidējie_50–249` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2022$`vidējie_50–249`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2022$`lielie_250+` <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2022$`lielie_250+`/1000, 2))
REGIONS_GROUPS_ntabl953_001_2022$VISS <- sprintf("%.2f", round(REGIONS_GROUPS_ntabl953_001_2022$VISS/1000, 2))

REGIONS_GR953_2022_formatted <- REGIONS_GROUPS_ntabl953_001_2022
rm(REGIONS_GROUPS_ntabl953_001_2022)

# Izprintējam

setwd("F:\\Izstrades_printOut")
write.table(REGIONS_GR953_2022_formatted, "DI_infoApskats_tab1_2_REGIONS_GROUPS_ntabl953_001_2022.csv", 
            sep = ";", col.names = TRUE, row.names = FALSE, qmethod = "double")
rm(REGIONS_GR953_2022_formatted)
