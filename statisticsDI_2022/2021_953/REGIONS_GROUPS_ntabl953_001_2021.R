#1 paņem datus
library(XLConnect)

setwd('F:\\Dati\\2021')
wb <- loadWorkbook("GR1_21_953.xlsx",
                   create = FALSE,
                   password = NULL)
setwd('C:\\Users\\atetere\\Documents')
worksheet <- readWorksheet(wb, sheet = "GR1_21_953")
rm(wb)

source("F:\\regioni_vektors.R")

REGIONS_GROUPS_ntabl953_001_2021 <- worksheet[worksheet$Nos %in% regions, c("NSV", "DAT", "NTABL", "RAJ", "Nos", "G5", "lielums", "GRUPA")]
rownames(REGIONS_GROUPS_ntabl953_001_2021) <- NULL
rm(worksheet)

#2 sadalām grupas
REGIONS_GROUPS_ntabl953_001_2021$GRUPA <- factor(REGIONS_GROUPS_ntabl953_001_2021$GRUPA)
levels(REGIONS_GROUPS_ntabl953_001_2021$GRUPA)

REGIONS_GROUPS_ntabl953_001_2021 <- split(REGIONS_GROUPS_ntabl953_001_2021, REGIONS_GROUPS_ntabl953_001_2021$GRUPA)
names(REGIONS_GROUPS_ntabl953_001_2021)[names(REGIONS_GROUPS_ntabl953_001_2021) == "1"] <- "mikro_1–9"
names(REGIONS_GROUPS_ntabl953_001_2021)[names(REGIONS_GROUPS_ntabl953_001_2021) == "2"] <- "mazie_10–49"
names(REGIONS_GROUPS_ntabl953_001_2021)[names(REGIONS_GROUPS_ntabl953_001_2021) == "3"] <- "vidējie_50–249"
names(REGIONS_GROUPS_ntabl953_001_2021)[names(REGIONS_GROUPS_ntabl953_001_2021) == "7"] <- "lielie_250+"
names(REGIONS_GROUPS_ntabl953_001_2021)[names(REGIONS_GROUPS_ntabl953_001_2021) == "11"] <- "VISS"
list2env(REGIONS_GROUPS_ntabl953_001_2021, envir = .GlobalEnv)

rm(REGIONS_GROUPS_ntabl953_001_2021)

#3 Savienojam tabulas

colnames(`mikro_1–9`)[colnames(`mikro_1–9`) == "G5"] <- "mikro_1–9"
REGIONS_GROUPS_ntabl953_001_2021 <- `mikro_1–9`[ , c("RAJ", "Nos", "mikro_1–9")]
rownames(REGIONS_GROUPS_ntabl953_001_2021) <- NULL
rm(`mikro_1–9`)

colnames(`mazie_10–49`)[colnames(`mazie_10–49`) == "G5"] <- "mazie_10–49"
mazie <- `mazie_10–49`[ , c("Nos", "mazie_10–49")]
rownames(mazie) <- NULL
rm(`mazie_10–49`)

REGIONS_GROUPS_ntabl953_001_2021 <- merge(REGIONS_GROUPS_ntabl953_001_2021, mazie, by.x = "Nos", by.y = "Nos")
rm(mazie)

colnames(`vidējie_50–249`)[colnames(`vidējie_50–249`) == "G5"] <- "vidējie_50–249"
videjie <- `vidējie_50–249`[ , c("Nos", "vidējie_50–249")]
rownames(videjie) <- NULL
rm(`vidējie_50–249`)

REGIONS_GROUPS_ntabl953_001_2021 <- merge(REGIONS_GROUPS_ntabl953_001_2021, videjie, by.x = "Nos", by.y = "Nos")
rm(videjie)

colnames(`lielie_250+`)[colnames(`lielie_250+`) == "G5"] <- "lielie_250+"
lielie <- `lielie_250+`[ , c("Nos", "lielie_250+")]
rownames(lielie) <- NULL
rm(`lielie_250+`)

REGIONS_GROUPS_ntabl953_001_2021 <- merge(REGIONS_GROUPS_ntabl953_001_2021, lielie, by.x = "Nos", by.y = "Nos")
rm(lielie)

colnames(`VISS`)[colnames(`VISS`) == "G5"] <- "VISS"
Viss <- `VISS`[ , c("Nos", "VISS")]
rownames(Viss) <- NULL
rm(`VISS`)

REGIONS_GROUPS_ntabl953_001_2021 <- merge(REGIONS_GROUPS_ntabl953_001_2021, Viss, by.x = "Nos", by.y = "Nos")
rm(Viss)

#4 Nokopies

REGIONS_GROUPS_ntabl953_001_2021 <- REGIONS_GROUPS_ntabl953_001_2021[order(match(REGIONS_GROUPS_ntabl953_001_2021$Nos, regions)), ]
rownames(REGIONS_GROUPS_ntabl953_001_2021) <- NULL

#5 pārbaude
for (i in 3:7) {
  a <-  sum(REGIONS_GROUPS_ntabl953_001_2021[-1, i])
  b <- REGIONS_GROUPS_ntabl953_001_2021[1, i]
  print(a==b || (abs(a) - abs(b)) <= 1)
  rm(a, b)
}
rm(i, regions)
