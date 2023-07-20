library(ggplot2)
#----------------Histograms and Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 15)

#add colour
s + geom_histogram(binwidth = 10, fill="Green")
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>>>3

#sometimes density charts are needed
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")
