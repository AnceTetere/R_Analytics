getwd()
setwd("D:\\R scripts and databases\\Data sets")

deck <- read.csv("deck.csv")
head(deck, 5)

deck[-1, 1:3] #returns everything but the first row in the table
deck[-(2:52), 1:3]  #returns the first row and ignores everything else 
head(deck[-1, 1, drop = FALSE])
