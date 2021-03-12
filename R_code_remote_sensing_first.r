# il mio primo codice in R per il telerilevamento!
setwd("C:/lab/") #per pescare la cartella working directory
install.packages("raster") #per installare il pacchetto raster
library(raster)
p224r63_2011<-brick("p224r63_2011_masked.grd") #importa immagine e associa nome
p224r63_2011 #immagine
plot(p224r63_2011) #per visualizzare le singole bande
