# Sys.setenv(JAVA_OPTS = "-Xmx8g")
# SA procentu  ievadei šablonu taisa no indeksu rāmja
# Šablons nav jāgatavo, jo izmantojam 6_DII010c_2000_2023Q1_LC_OTH_TOT_SA.R

# Dati nāk no dokumenta LCI_2023_C1_SA.xls.
# Ielādē izstrādātos indeksus.

setwd('F:\\DARBS)\\Dati')

library(XLConnect)
wb <- loadWorkbook("LCI_2023_C1_SA.xls",
                   create = FALSE,
                   password = NULL)

setwd('C:\\Users\\atetere\\Documents')
worksheet <- readWorksheet(wb, sheet = "%") # 7813
rm(wb)

colnames(worksheet)[1] <- "Nace"
colnames(worksheet)[2] <- "DI komponents"
colnames(worksheet)[3] <- "procentuālās izmaiņas"

worksheet <- worksheet[-1, ]
rownames(worksheet) <- NULL

datiProcentiem_2000_2023_SA <- worksheet[, 1:3] # 7812 rows
rm(worksheet)

# no datiProcentiem_2000_2023_SA izņemt NACE agregātus B-N un O-S
datiProcentiem_2000_2023_SA <-
  datiProcentiem_2000_2023_SA[datiProcentiem_2000_2023_SA$Nace != "B_N LASP" &
                                datiProcentiem_2000_2023_SA$Nace != "O_S Lasp",] #7068

# paņem uzreiz kārtību, kaut arī to var nevajadzēt
#colnames(LCI2000_2023_seasonally_adjusted)
datiProcentiem_2000_2023_SA$order <-
  paste(
    datiProcentiem_2000_2023_SA$Nace,
    datiProcentiem_2000_2023_SA$`DI komponents`,
    datiProcentiem_2000_2023_SA$`procentuālās izmaiņas`,
    sep = "_"
  )
datuOrder_SA <- datiProcentiem_2000_2023_SA$order

# OK, šitie tad ir jādala sīkāk šablona fails jau ir sadalīts, jo ņemam šablonus no indeksiem
# Un tagad jāsadala datu fails
datiProcentiem_2000_2023_SA$`DI komponents` <-
  factor(datiProcentiem_2000_2023_SA$`DI komponents`)
levels(datiProcentiem_2000_2023_SA$`DI komponents`)

datiProcentiem_2000_2023_SA_DIkomponents <-
  split(datiProcentiem_2000_2023_SA,
        datiProcentiem_2000_2023_SA$`DI komponents`)
names(datiProcentiem_2000_2023_SA_DIkomponents)[names(datiProcentiem_2000_2023_SA_DIkomponents) == "Total"] <-
  "dataTotal_LCI2000_2023SA_procenti"
names(datiProcentiem_2000_2023_SA_DIkomponents)[names(datiProcentiem_2000_2023_SA_DIkomponents) == "Wages"] <-
  "dataWages_LCI2000_2023SA_procenti"
names(datiProcentiem_2000_2023_SA_DIkomponents)[names(datiProcentiem_2000_2023_SA_DIkomponents) == "Other"] <-
  "dataOther_LCI2000_2023SA_procenti"
names(datiProcentiem_2000_2023_SA_DIkomponents)[names(datiProcentiem_2000_2023_SA_DIkomponents) == "Total except bonuses"] <-
  "dataTXB_LCI2000_2023SA_procenti"
list2env(datiProcentiem_2000_2023_SA_DIkomponents, envir = .GlobalEnv)
rm(
  datiProcentiem_2000_2023_SA_DIkomponents,
  datiProcentiem_2000_2023_SA,
  dataTXB_LCI2000_2023SA_procenti
)

rownames(dataOther_LCI2000_2023SA_procenti) <- NULL
rownames(dataTotal_LCI2000_2023SA_procenti) <- NULL
rownames(dataWages_LCI2000_2023SA_procenti) <- NULL
