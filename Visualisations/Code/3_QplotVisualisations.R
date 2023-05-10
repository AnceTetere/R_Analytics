library(ggplot2)

# Visualizing With new Split

qplot(data=mergedDF, x=Internet.users, y=Birth.rate)
qplot(data=mergedDF, x=Internet.users, y=Birth.rate,
      colour=Region)

#1. Shapes
qplot(data=mergedDF, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(17))

#2. Transparency
qplot(data=mergedDF, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.6))

#3. Title
qplot(data = mergedDF, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(5), shape = I(19),
      alpha = I(0.6),
      main = "Birth Rate vs Internet Users") +
  theme(plot.title = element_text(hjust = 0.5)) #centers the title
      
      
      