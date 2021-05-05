#R code land cover
setwd("C:/lab/")
library(raster)
library(RStoolbox)
install.packages("ggplot2")
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)

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




