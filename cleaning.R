#change working director to were data file is stored
setwd("~/Coursera/Data Analysis and Statistical Inference/project")

library(dplyr)
library(ggplot2)
clean <- read.csv("./cleaning.csv")
clean <- select(clean, c(Time_min, Polymer, Run, Coupon))


png(filename = "./Multivariate.png", width = 640, height = 480, units = "px")

plot(clean[,c(1:4)], col = "red", 
                   pch = 16,
                   main = "Multivariate Plot of Study Design\n Polymer A = 1 B = 2")

dev.off()




clean <- select(clean, c(Polymer,Time_min))
 



png(filename = "./Boxplot.png", width = 640, height = 480, units = "px")
boxplot(Time_min ~ Polymer, data=clean, col = "lightblue",
                                      plot=TRUE,
                                      ylim=c(0,120),
                                      main = "Boxplot: Cleaning Time by Polymer",
                                      xlab ="Polymer",
                                      ylab ="Cleaning Time (min)",
                                      sub = "dashed red line = overall mean")
abline(h=53.2, lty=2, col="red")

dev.off()

polyA <- subset(clean, Polymer == 'A')
polyB <- subset(clean, Polymer == 'B')

mean(clean$Time_min)
summary(polyA)
summary(polyB)

