#Introduction to qplot()
library(ggplot2)

qplot(data = stats, 
      x=Internet.users)

qplot(data = stats,x=Income.Group, y=Birth.rate)
qplot(data = stats,x=Income.Group, y=Birth.rate, size = 3)
qplot(data = stats,x=Income.Group, y=Birth.rate, size = 10)
qplot(data = stats,x=Income.Group, y=Birth.rate, size = I(10))
qplot(data = stats,x=Income.Group, y=Birth.rate, 
      size = I(10), colour="blue")
qplot(data = stats,x=Income.Group, y=Birth.rate, 
      size = I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")