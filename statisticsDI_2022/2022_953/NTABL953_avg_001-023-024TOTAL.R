source("F:\\R_kods\\NTABL953_avg_001.R")

NTABL953_avg_001TOTAL <- NTABL953_avg_001[NTABL953_avg_001$NOZARE2 == "TOTAL", ] 
NTABL953_avg_001TOTAL$G5 #853656

## 001TOTAL$G5 tūkstošos 
NTABL953_avg_001TOTAL$G5 / 1000 # 853.656 tūkstoši
round(NTABL953_avg_001TOTAL$G5 / 1000, 1) 

print("2022. gadā vidējais darbinieku skaits, par kuriem jāveic darba laika uzskaite bija")
round(NTABL953_avg_001TOTAL$G5 / 1000, 1)
"tūkstoši"
rm(NTABL953_avg_001)

source("F:\\R_kods\\NTABL953_sPUB-PRIV_avg.R")

NTABL953_avg_023TOTAL <- NTABL953_sPUB_avg[NTABL953_sPUB_avg$NOZARE2 == "TOTAL", ]
NTABL953_avg_023TOTAL$G5 #268619

## 023TOTAL$G5 tūkstošos 
NTABL953_avg_023TOTAL$G5 / 1000
round(NTABL953_avg_023TOTAL$G5 / 1000, 1)

print("2022. gadā sabiedriskajā sektorā vidējais darbinieku skaits, par kuriem jāveic darba laika uzskaite bija")
round(NTABL953_avg_001TOTAL$G5 / 1000, 1)
"tūkstoši"

rm(NTABL953_sPUB_avg)

# Privātajā sektorā aizņemto vietu skaits 2022. gadā
NTABL953_avg_024TOTAL <- NTABL953_sPRIV_avg[NTABL953_sPRIV_avg$NOZARE2 == "TOTAL", ]
NTABL953_avg_024TOTAL$G5

## 024TOTAL$G5 tūkstošos 
NTABL953_avg_024TOTAL$G5 / 1000 
round(NTABL953_avg_024TOTAL$G5 / 1000, 1) 

print("2022. gadā privātajā sektorā vidējais darbinieku skaits, par kuriem jāveic darba laika uzskaite bija")
round(NTABL953_avg_001TOTAL$G5 / 1000, 1)
"tūkstoši"

rm(NTABL953_sPRIV_avg)

# pārbaude
NTABL953_avg_001TOTAL$G5 == (NTABL953_avg_023TOTAL$G5 + NTABL953_avg_024TOTAL$G5)
# rm(NTABL953_avg_001TOTAL, NTABL953_avg_023TOTAL, NTABL953_avg_024TOTAL)
