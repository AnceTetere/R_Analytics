# Izveido procentu ailes
source("F:\\15_NOZARES_KopejasDI_base.R")

# 1. 2020 pret 2019
source("F:\\14_NOZARES_KopejasDI_2019.R")

subset_NOZ1 <- merge(NOZARES_KopejasDI[ , c("NOZARE2", "2020: G5")], NOZARES_KopejasDI_2019[ , c("NOZARE2", "2019: G5")],
                     by.x = "NOZARE2", by.y = "NOZARE2")
subset_NOZ1$"Change (%): 2020 vs. 2019" <- subset_NOZ1$`2020: G5`/subset_NOZ1$`2019: G5`* 100 - 100

## Pievieno izveidoto aili un nokopies

NOZARES_KopejasDI <- 
  merge(NOZARES_KopejasDI, subset_NOZ1[ , c("NOZARE2", "Change (%): 2020 vs. 2019")], by.x = "NOZARE2", by.y = "NOZARE2")
rm(subset_NOZ1, NOZARES_KopejasDI_2019)

# 2. 2021 pret 2020

NOZARES_KopejasDI$"Change (%): 2021 vs. 2020" <- NOZARES_KopejasDI$`2021: G5`/NOZARES_KopejasDI$`2020: G5`* 100 - 100

# 3. 2022. pret 2021.

NOZARES_KopejasDI$"Change (%): 2022 vs. 2021" <- NOZARES_KopejasDI$`2022: G5`/NOZARES_KopejasDI$`2021: G5`* 100 - 100

# 4. Nokopies

source("F:\\nozares_vektors.R")
NOZARES_KopejasDI <- NOZARES_KopejasDI[order(match(NOZARES_KopejasDI$NOZARE2, nozares)), ]
rownames(NOZARES_KopejasDI) <- NULL
rm(nozares)
