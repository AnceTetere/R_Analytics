#Sys.setenv(JAVA_OPTS = "-Xmx8g")
#Procentu  ievadei šablonu taisam no jau izveidotā indeksu rāmja

# Tātad šablons nav jāgatavo, jo izmanto indeksu tabulas.
# Dati nāk no non-adjusted dokumenta LCI_2023_aprekini.xlsx.

setwd(
  'F:\\DARBS\\1_sagatavosana_2023'
)

library(XLConnect)
wb <- loadWorkbook("LCI_2023_aprekini.xlsx",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Users\\atetere\\Documents')
worksheet <- readWorksheet(wb, sheet = "all_transpose (%)") # 7813
rm(wb)

colnames(worksheet) <- worksheet[1, ]
worksheet <- worksheet[-1, ]
rownames(worksheet) <- NULL

datiProcentiem_2000_2023Q1_NSA <- worksheet[, 1:5] #7812
rm(worksheet)

# paņem uzreiz kārtību, kaut arī to var nevajadzēt
colnames(datiProcentiem_2000_2023Q1_NSA)

# izņem uzreiz NACE agregātus B-N un O-S
datiProcentiem_2000_2023Q1_NSA <-
  datiProcentiem_2000_2023Q1_NSA[datiProcentiem_2000_2023Q1_NSA$Nace != "B_N_LASP" &
                                   datiProcentiem_2000_2023Q1_NSA$Nace != "O_S_LASP",] #7068
datiProcentiem_2000_2023Q1_NSA$order <-
  paste0(
    datiProcentiem_2000_2023Q1_NSA$Gads,
    "Q",
    datiProcentiem_2000_2023Q1_NSA$Q,
    datiProcentiem_2000_2023Q1_NSA$Nace,
    datiProcentiem_2000_2023Q1_NSA$nosaukums,
    datiProcentiem_2000_2023Q1_NSA$"1"
  )
datuOrder_NSA <- datiProcentiem_2000_2023Q1_NSA$order

# Datu failu sadali. OSP šablons nāk no indeksiem
datiProcentiem_2000_2023Q1_NSA$Nosaukums <-
  factor(datiProcentiem_2000_2023Q1_NSA$Nosaukums)
levels(datiProcentiem_2000_2023Q1_NSA$Nosaukums)

datiProcentiem_2000_2023Q1_NSA_Nosaukums <-
  split(datiProcentiem_2000_2023Q1_NSA,
        datiProcentiem_2000_2023Q1_NSA$Nosaukums)
names(datiProcentiem_2000_2023Q1_NSA_Nosaukums)[names(datiProcentiem_2000_2023Q1_NSA_Nosaukums) == "Total"] <-
  "dataTotal_LCI2000_2023NSA_procenti"
names(datiProcentiem_2000_2023Q1_NSA_Nosaukums)[names(datiProcentiem_2000_2023Q1_NSA_Nosaukums) == "Wages"] <-
  "dataWages_LCI2000_2023NSA_procenti"
names(datiProcentiem_2000_2023Q1_NSA_Nosaukums)[names(datiProcentiem_2000_2023Q1_NSA_Nosaukums) == "Other"] <-
  "dataOther_LCI2000_2023NSA_procenti"
names(datiProcentiem_2000_2023Q1_NSA_Nosaukums)[names(datiProcentiem_2000_2023Q1_NSA_Nosaukums) == "Total except bonuses"] <-
  "dataTXB_LCI2000_2023NSA_procenti"
list2env(datiProcentiem_2000_2023Q1_NSA_Nosaukums, envir = .GlobalEnv)
rm(
  datiProcentiem_2000_2023Q1_NSA_Nosaukums,
  datiProcentiem_2000_2023Q1_NSA,
  dataTXB_LCI2000_2023NSA_procenti
)

