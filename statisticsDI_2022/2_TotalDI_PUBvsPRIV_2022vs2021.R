# Kopējās darbaspēka izmaksas privātajā sektorā 2022. gadā.
source(
  "F:\\3_PRIV_KopejasDI_2022.R"
)

# Kopējās darbaspēka izmaksas privātajā sektorā 2021. gadā.
source(
  "F:\\4_PRIV_KopejasDI_2021.R"
)

# Kopējās darbaspēka izmaksas sabiedriskajā sektorā 2022. gadā.
source(
  "F:\\5_PUB_KopejasDI_2022.R"
)

# Kopējās darbaspēka izmaksas sabiedriskajā sektorā 2021. gadā.
source(
  "F:\\4_PUB_KopejasDI_2021.R"
)

# Procentuālās izmaiņas privātajā sektorā
percentageChange_PRIV2022vs2021 <-
  mpfr(PRIV_KopejasDI_2022 / PRIV_KopejasDI_2021 * 100 - 100, precBits = 64)

# Procentuālās izmaiņas sabiedriskajā sektorā
percentageChange_PUB2022vs2021 <-
  mpfr(PUB_KopejasDI_2022 / PUB_KopejasDI_2021 * 100 - 100, precBits = 64)

paste(
  "Privātajā sektorā darbaspēka izmaksas augušas straujāk (par",
  sprintf("%.1f", round(percentageChange_PRIV2022vs2021, 1)),
  "% gadā), savukārt sabiedriskajā – par",
  sprintf("%.1f", round(percentageChange_PUB2022vs2021, 1)),
  "%. Pēdējo desmit gadu laikā privātajā sektorā tas ir lielākais pieaugums."
)
