#R code land cover

library(raster)
library(RStoolbox)
install.packages("ggplot2")
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)

setwd("C:/lab/")

#NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin") #plot con le coordinate

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#multiframe con ggplot2 e gridExtra

p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="Lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="Lin")
grid.arrange(p1, p2, nrow = 2) 

#unsupervised classification
d1c <- unsuperClass(defor1, nClasses = 2)
d1c
plot(d1c$map)
#class 1: forest
#class 2: agricolture

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

#frequenze nelle classi
freq(d1c$map)
 value  count
[1,]     1  35583
[2,]     2 305709

s1 <- 35583 + 305709

# proporzione defor1
prop1 <- freq(d1c$map) / s1
 value     count
[1,] 2.930042e-06 0.1042597
[2,] 5.860085e-06 0.8957403
#prop forest: 0.8957403
#prop agriculture:  0.1042597


#prop defor2
s2 <- 342726
prop2 <- freq(d2c$map) / s2

value     count
[1,] 2.917783e-06 0.5205587
[2,] 5.835565e-06 0.4794413

#prop forest: 0.5205587
#prop agriculture: 0.4794413

#build dataframe
cover <- c("Forest", "Agriculture")
percent_1992 <- c(89.57, 10.42)
percent_2006 <- c(52.05, 47.94)
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages
#costruisci grafico plot

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)






