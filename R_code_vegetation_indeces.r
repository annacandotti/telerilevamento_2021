# R_code_vegetation_indeces.r
library(raster) #require(raster)
library(RStoolbox)
library(rasterdiv)
library(rasterVis)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#banda1 =Nir, banda2=red, banda3=green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

dvi1 <- defor1$defor1.1-defor1$defor1.2 #calcolo del difference vegetation index per la prima immagine
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")

dvi2 <- defor2$defor2.1-defor2$defor2.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1 - dvi2 #differenza di dvi tra le 2 immagini
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)

#ndvi (NIR-RED)/(NIR+RED)
ndvi1 <- (defor1$defor1.1-defor1$defor1.2)/(defor1$defor1.1+defor1$defor1.2)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndvi1, col=cl)

#RStoolbox: spectralIndices

ndvi2 <- (defor2$defor2.1-defor2$defor2.2)/(defor2$defor2.1+defor2$defor2.2)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndvi2, col=cl)

vi <- spectralIndices(defor1, green = 3, red = 2, nir =1)
plot(vi, col=cl)
vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)

difndvi <- ndvi1 - ndvi2 
plot(difndvi, col=cld)

plot(copNDVI) #worldwideNDVI
#pixel con valori 253, 254, 255 (acqua) saranno impostati come NA
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

levelplot(copNDVI)
