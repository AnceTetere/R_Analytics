source("F:\\2_KopējāsDI_2022.R")
source("F:\\3_KopējāsDI_2021.R")

percentageChange_2022vs2021 <-
  KopejasDI_2022 / KopejasDI_2021 * 100 - 100
changeKopejasDI_2022vs2021 <- KopejasDI_2022 - KopejasDI_2021

paste(
  "Kopējās darbaspēka izmaksas 2022. gadā, salīdzinot ar 2021. gadu, palielinājās par",
  sprintf("%.1f", round(percentageChange_2022vs2021, 1)),
  "% jeb",
  sprintf("%.1f", round(changeKopejasDI_2022vs2021 / 1000000, 1)),
  "milj. eiro, sasniedzot",
  sprintf("%.1f", round(KopejasDI_2022 / 1000000, 1)),
  "milj. eiro."
)

rm(
  changeKopejasDI_2022vs2021,
  KopejasDI_2021,
  KopejasDI_2022,
  percentageChange_2022vs2021
)
