# R_code_no2.r 

library(raster)
library(RStoolbox)

setwd("C:/lab/EN")

EN01 <- raster("EN_001.png")

cls <- colorRampPalette(c("red", "pink", "orange", "yellow")) (200)
plot(EN01, col=cls)

EN13 <- raster("EN_0013.png")

cls <- colorRampPalette(c("red", "pink", "orange", "yellow")) (200)
plot(EN13, col=cls)

ENdif <- EN13 - EN01
plot(ENdif, col=cls)

par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")

#per importare tutto il set
#list of files
rlist <- list.files(pattern="EN") #vedere il pattern comune nella cartella: qui EN per creare una lista
rlist

import <- lapply(rlist, raster) #importo i singoli layer nella lista
import 

EN <- stack(import) #compatto i layer con la funzione stack (EN in questo caso e il mio stack)
plot(EN, col=cls)

#ora posso plottare singoli layer pescandoli dallo stack, dentro EN visualizzo i singoli layer
par(mfrow=c(2,1))
plot(EN$EN_001, col=cls)
plot(EN$EN_013, col=cls)

#pca

ENpca <- rasterPCA(EN)
summary(ENpca$model)

plotRGB(ENpca$map, r=1, g=2, b=3, stretch="lin")

#st dev sulla prima componente
PC1sd <-focal(ENpca$map$PC1, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(PC1sd, col=cls)
