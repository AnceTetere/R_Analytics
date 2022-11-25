experiment1 <- read.csv(file.choose())

experiment1$CRB == "group3"
sum(experiment1$CRB == "group3")

experiment1$value[experiment1$CRB == "group3"]
experiment1$value[experiment1$CRB == "group3"] <- 14
head(experiment1, 20)