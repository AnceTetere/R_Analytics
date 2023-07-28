library(ggplot2)
#--------------------Statistical Transformations

?geom_smooth

u <- ggplot(data=movies, 
            aes(x=CriticRating, 
                y=AudienceRating,
                colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies,
            aes(x=Genre,
                y= AudienceRating,
                colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

#Comparisons for CriticRating
#boxplots
u <- ggplot(data=movies,
            aes(x=Genre,
                y= CriticRating,
                colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
