#R_code_variability.r

library(raster)
library(RStoolbox)
library(ggplot2)
install.packages("viridis")
library(viridis)
library(gridExtra)

setwd("C:/lab/")

#NIR=1
#RED=2
#GREEN=3
#brick per importare tutto il blocco di bande

sent <- brick("sentinel.png")

#plotRGB(x, r=1, g=2, b=3)

plotRGB(sent, stretch="lin")
#importa i canali di colore di default in base all´ordine delle bande # uguale a plotRGB(sent, r=1, g=2, b=3, stretch="lin")

nir <- sent$sentinel.1
red <- sent$sentinel.2
ndvi <- (nir-red)/(nir+red)
plot(ndvi)

cl <- colorRampPalette(c("black", "white", "red", "magenta", "green"))(100)
plot(ndvi, col=cl)

ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd) 
plot(ndvisd3)
#w=window #finestra di 9 pixel in cui venga calcolato ciascuno in 3 righe e 3 colonne
#calcolo dev st dell´immagine

clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown"))(100)
plot(ndvisd3, col=clsd)

#allo stesso modo posso calcolare la media
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean) 
plot(ndvimean3, col=clsd)









