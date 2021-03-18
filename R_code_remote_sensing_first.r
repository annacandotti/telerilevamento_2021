# il mio primo codice in R per il telerilevamento!
setwd("C:/lab/") #per pescare la cartella working directory #windows
install.packages("raster") #per installare il pacchetto raster
library(raster) # per richiamare il pacchetto raster installato dall´esterno
p224r63_2011<-brick("p224r63_2011_masked.grd") #importa immagine e associa nome
p224r63_2011 #immagine info
plot(p224r63_2011) #per visualizzare le Rif nelle singole bande
cl <- colorRampPalette(c("black","grey","light grey")) (100) #per impostare i colori della scala di Rif
plot(p224r63_2011, col=cl) #per associare la palette all´immagine #argomenti di una funzione sempre separati da una virgola
cl <- colorRampPalette(c("purple","red","orange", "yellow")) (100) #altri colori
plot(p224r63_2011, col=cl) #associare la palette all´immagine
