source("F:\\13_NOZARES_KopejasDI_proportions.R")

sum(NOZARES_KopejasDI$`Change (%): 2022 vs. 2021` > 0) == nrow(NOZARES_KopejasDI) 

max1 <- NOZARES_KopejasDI$Nos_noz[NOZARES_KopejasDI$`Change (%): 2022 vs. 2021` == max(NOZARES_KopejasDI$`Change (%): 2022 vs. 2021`)]
subset1 <- NOZARES_KopejasDI[NOZARES_KopejasDI$Nos_noz != max1, ]

max2 <- subset1$Nos_noz[subset1$`Change (%): 2022 vs. 2021` == max(subset1$`Change (%): 2022 vs. 2021`)]
subset2 <- subset1[subset1$Nos_noz != max2, ]

max3 <- subset2$Nos_noz[subset2$`Change (%): 2022 vs. 2021` == max(subset2$`Change (%): 2022 vs. 2021`)]

paste("....",
      tolower(max1), "nozarē (", sprintf("%.1f", round(max(NOZARES_KopejasDI$`Change (%): 2022 vs. 2021`), 1)), "%), kam sekoja", 
      tolower(max2), "ar", sprintf("%.1f", round(max(subset1$`Change (%): 2022 vs. 2021`), 1)), "% un", tolower(max3), "nozare ar", 
      sprintf("%.1f", round(max(subset2$`Change (%): 2022 vs. 2021`), 1)), "% izmaksu pieaugumu.")

rm(subset2, max3, subset1, max2, max1) 
