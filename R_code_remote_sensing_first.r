# il mio primo codice in R per il telerilevamento!
setwd("C:/lab/") #per pescare la cartella working directory #windows
install.packages("raster") #per installare il pacchetto raster
library(raster) # per richiamare il pacchetto raster installato dall´esterno
p224r63_2011<-brick("p224r63_2011_masked.grd") #importa immagine e associa nome
p224r63_2011 #immagine info
plot(p224r63_2011) #per visualizzare le Rif nelle singole bande
#B1 blu #B2 verde #B3 rosso #B4 nir #B5 swir #B6 therm infr #B7 swir #B8 pancromatico

cl <- colorRampPalette(c("black","grey","light grey")) (100) #per impostare i colori della scala di Rif
plot(p224r63_2011, col=cl) #per associare la palette all´immagine #argomenti di una funzione sempre separati da una virgola
cl <- colorRampPalette(c("purple","red","orange", "yellow")) (100) #altri colori
plot(p224r63_2011, col=cl) #associare la palette all´immagine
dev.off() #ripulisce la finestra grafica
plot(p224r63_2011$B1_sre)
cl <- colorRampPalette(c("purple","red","orange", "yellow")) (100)
plot(p224r63_2011$B1_sre, col=cl) #color palette banda 1

plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre) #così mette la B2 nel plot della B1

par(mfrow=c(1,2)) # par serve a definire come mettere le immagini, in questo caso 2 immagini in 1 riga e 2 colonne 
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

par(mfrow=c(2,1)) # par serve a definire come mettere le immagini, in questo caso 2 immagini in 2 righe e 1 colonna, mettendo prima row indico prima le righe
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

par(mfrow=c(2,2)) # un quadrato di bande
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb) #plotto la banda del blu con la color ramp palette
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)


