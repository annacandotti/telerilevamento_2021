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
#mean ndvi with local 
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean) 
plot(ndvimean3, col=clsd)

ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd) 
plot(ndvisd13, col = clsd)

ndvisd25 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
plot(ndvisd25, col = clsd)

#pca
sentpca <- rasterPCA(sent)
plot(sentpca$map)
summary(sentpca$model)
#la prima pc descrive il 67% della variabilita


#deviazione standard della  prima cp
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown")) (100)
plot(pc1sd5, col=clsd)
                         

source("source_ggplot.r") #carica direttamente il codice se presente nella wd

#plottare i dati tramite ggplot
#definizione della geometria del grafico, a punti con geom_point, a linee con geom_line, con i raster geom_raster creo la mappa
#mappo x,y e il valore (layer) della dev st
#per individuare le discontinuita, variabilita geomorfologica o ecologica, zone omogenee = meno diversita
ggplot() +
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill=layer))

#funzione scale_fill_viridis() dentro al pacchetto viridis per applicare una legenda senza dover scrivere la colorRampPalette
p1 <- ggplot() +
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation of PC1 by viridis colour scale") #aggiungo titolo al plot con legenda

p2 <- ggplot() +
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation of PC1 by magma colour scale")
#visualizzo le zone con alta dev st

ggplot() +
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill=layer)) +
scale_fill_viridis(option = "inferno") +
ggtitle("Standard deviation of PC1 by inferno colour scale")

p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill=layer)) +
scale_fill_viridis(option = "turbo") +
ggtitle("Standard deviation of PC1 by turbo colour scale")

#funzione per unire piu mappe virids(p1), magma(p2), turbo(p3) con grid.arrange della libreria grid.Extra
grid.arrange(p1, p2, p3, nrow= 3)
grid.arrange(p1, p2, p3, nrow= 1)














