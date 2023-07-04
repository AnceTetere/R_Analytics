# Pievieno īpatsvara ailes
source("F:\\16_NOZARES_KopejasDI_percentChange.R")

## īpatsvars % 2020

NOZARES_KopejasDI$"Īpatsvars (%): 2020" <- 
  NOZARES_KopejasDI$`2020: G5`/NOZARES_KopejasDI$`2020: G5`[NOZARES_KopejasDI$NOZARE2 == "TOTAL"] * 100

#pārbaude
round(sum(NOZARES_KopejasDI$`Īpatsvars (%): 2020`[-1])) == round(NOZARES_KopejasDI$`Īpatsvars (%): 2020`[1])

## īpatsvars % 2021

NOZARES_KopejasDI$"Īpatsvars (%): 2021" <- 
  NOZARES_KopejasDI$`2021: G5`/NOZARES_KopejasDI$`2021: G5`[NOZARES_KopejasDI$NOZARE2 == "TOTAL"] * 100

#pārbaude
round(sum(NOZARES_KopejasDI$`Īpatsvars (%): 2021`[-1])) == round(NOZARES_KopejasDI$`Īpatsvars (%): 2021`[1])

## īpatsvars % 2022

NOZARES_KopejasDI$"Īpatsvars (%): 2022" <- 
  NOZARES_KopejasDI$`2022: G5`/NOZARES_KopejasDI$`2022: G5`[NOZARES_KopejasDI$NOZARE2 == "TOTAL"] * 100

#pārbaude
round(sum(NOZARES_KopejasDI$`Īpatsvars (%): 2022`[-1])) == round(NOZARES_KopejasDI$`Īpatsvars (%): 2022`[1])

# Novācies

source("F:\\nozares_vektors.R")
NOZARES_KopejasDI <- NOZARES_KopejasDI[order(match(NOZARES_KopejasDI$NOZARE2, nozares)), ]
NOZARES_KopejasDI<- NOZARES_KopejasDI[ , c("NSV", "Nos_noz", "NOZARE2", "2020: G5", "2021: G5", "2022: G5", "Change (%): 2020 vs. 2019", "Change (%): 2021 vs. 2020", "Change (%): 2022 vs. 2021", "Īpatsvars (%): 2020", "Īpatsvars (%): 2021", "Īpatsvars (%): 2022")]

colnames(NOZARES_KopejasDI)
rownames(NOZARES_KopejasDI) <- NULL
rm(nozares)
