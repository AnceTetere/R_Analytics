# Salīdzinājums: 2020, 2021, 2022

# 1. savieno
source("F:\\11_NOZARES_KopejasDI_2022.R")
source("F:\\12_NOZARES_KopejasDI_2021.R")

NOZARES_KopejasDI <- merge(NOZARES_KopejasDI_2022[ , c("NSV", "NOZARE2", "Nos_noz",  "2022: G5")], 
                           NOZARES_KopejasDI_2021[ , c("NOZARE2",  "2021: G5")], 
                           by.x = "NOZARE2", by.y = "NOZARE2")

rm(NOZARES_KopejasDI_2022, NOZARES_KopejasDI_2021)

# 2. Pievieno 2020 gadu
source("F:\\13_NOZARES_KopejasDI_2020.R")

NOZARES_KopejasDI <- merge(NOZARES_KopejasDI, 
                           NOZARES_KopejasDI_2020[ , c("NOZARE2",  "2020: G5")], 
                           by.x = "NOZARE2", by.y = "NOZARE2")

rm(NOZARES_KopejasDI_2020)

# 3. sakārto
source("F:\\nozares_vektors.R")
NOZARES_KopejasDI <- NOZARES_KopejasDI[order(match(NOZARES_KopejasDI$NOZARE2, nozares)), c("NSV", "Nos_noz", "NOZARE2", "2020: G5", "2021: G5", "2022: G5")]
rm(nozares)

rownames(NOZARES_KopejasDI) <- NULL
