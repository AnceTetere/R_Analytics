#Sys.setenv(JAVA_OPTS = "-Xmx8g")
source(
  "F:\\DARBS\DII010c_2000_2022.R"
) # 5244 rows
rm(DII010c_2000_2022_SA)

# ! Uzreiz paņem order
NSA_order_2000_2022 <- DII010c_2000_2022_NSA$ORDER # 5224

# izstrādājam uzreiz 2023Q1

DII010c_2022Q4_NSA <-
  DII010c_2000_2022_NSA[DII010c_2000_2022_NSA$TIME == "2022Q4",] #57
DII010c_2022Q4_NSA$TIME <- "2023Q1"
DII010c_2023Q1_NSA <- DII010c_2022Q4_NSA
rm(DII010c_2022Q4_NSA)

colOrder_vec <- colnames(DII010c_2023Q1_NSA)
DII010c_2023Q1_NSA$ORDER <-
  paste0("2023Q1", (substr(
    DII010c_2023Q1_NSA$ORDER, 7, nchar(DII010c_2023Q1_NSA$ORDER)
  )))
DII010c_2023Q1_NSA_orderVec <- DII010c_2023Q1_NSA$ORDER

# Make a new grand order vector including 2023Q1
originalOrder_2000_2023 <-
  append(originalOrder_2000_2022, DII010c_2023Q1_NSA_orderVec) # 10545
originalOrder_2000_2023 <-
  append(originalOrder_2000_2023, DII010c_2023Q1_NSA_orderVec) # 10602

rm(
  originalOrder_2000_2022,
  NSA_order_2000_2022,
  DII010c_2023Q1_NSA_orderVec,
  DII010c_2000_2022_NSA,
  DII010c_2023Q1_NSA
)

