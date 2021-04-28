#R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)
setwd("C:/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick carica direttamente un pacchetto di dati
p224r63_2011
plot(p224r63_2011)
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2) #plot di due bande
pairs(p224r63_2011) #mette in correlazione a coppie tutte le variabili del dataset(qui le bande)

#ricampionamento: funzione aggregate per aggregare i pixel ovvero diminuire la risoluzione con un certo fattore di ricampionamento
p224r63_2011res <- aggregate(p224r63_2011, fact=10)
p224r63_2011res

#per visualizzare il ricampionamento
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
p224r63_2011res_pca #contiene al suo interno la mappa e il modello
#funzione summary per ottenere un sommario del modello: quanta varianza spiegano le componenti
summary(p224r63_2011res_pca$model)
#visualizzo le singole componenti in mappa
plot(p224r63_2011res_pca$map)
#plotto in RGB l´immagine
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")
plot(p224r63_2011res_pca$map$PC1, p224r63_2011res_pca$map$PC2) #per vedere se c´è correlazione tra la pc1 e la pc2



