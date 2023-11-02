library(ggplot2)
library(reshape2)

# Dati no tabulas 1.3
tab12 <- data.frame(intervals = c("10,01...14,0", "14,01 ... 18,0", "18,01 ... 22,0", 
                                  "22,01 ...26,0", "26,01 ... 30,0", "30,01 ... 34,0"),
                    interval_midpoints = c(12, 16, 20, 24, 28, 32),
                    Group_1 = c(3, 17, 30, 28, 17, 5),
                    Group_2 = c(9, 27, 33, 21, 8, 2))

# Convert intervals to factors for correct ordering
tab12$intervals <- factor(tab12$intervals, levels = tab12$intervals)
tab12_melted <- melt(tab12, id.vars = c("intervals", "interval_midpoints"))


# Plotting histograms for Group_1 and Group_2
overlapping_histograms <- ggplot(data = tab12_melted, aes(x = intervals, y = value, linetype = variable)) +
  geom_bar(data = subset(tab12_melted, variable == "Group_1"), stat = "identity", 
           position = "dodge", width = 1, color = "black", fill = "transparent") +
  geom_bar(data = subset(tab12_melted, variable == "Group_2"), stat = "identity", 
           position = "dodge", width = 1, color = "black", fill = "transparent") +
  geom_text(aes(label = value), position = position_dodge(width = 0), vjust = -0.5, size = 3) +
  scale_x_discrete(labels = tab12$intervals) +  # Use midpoints on x-axis
  scale_linetype_manual(name = NULL, values = c("solid", "dashed"), 
                        labels = c("Ekoloģiskā grupa 1", "Ekoloģiskā grupa 2")) +
  theme_minimal() +
  labs(title = "Divu ekoloģisko grupu lauksaimniecības uzņēmumu sadalījumi pēc graudaugu ražības (%)", 
       x = "Graudaugu ražības intervāli (cnt/ha)", y = "Saimniecību relatīvie biežumi ekoloģiskajās grupās (%)")

overlapping_histograms +
  ggtitle("Divu ekoloģisko grupu lauksaimniecības uzņēmumu sadalījumi pēc graudaugu ražības (%)") +
  theme(axis.title.x = element_text(colour = "Black", size = 10, family = "Times New Roman"),
        axis.title.y = element_text(colour = "Black", size = 10, family = "Times New Roman"),
        axis.text.x = element_text(size = 7),
        axis.text.y = element_text(size = 7),
        
        legend.title = element_text(colour = "Black", size = 7), # 24. rindā noņēmu legend title, bet lai paliek priekš info te, netraucē
        legend.text = element_text(colour = "Dark blue", size = 7),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        
        plot.title = element_text(colour = "Black",
                                  size = 11,
                                  family = "Times New Roman"))

##### Fixing issues with the font
install.packages("extrafont")
library(extrafont)

font_import(paths="C:\\Windows\\Fonts")
loadfonts()
fonts()
