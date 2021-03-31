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


#visualizzazione dati RGB plot
setwd("C:/lab/")
install.packages("raster")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") #funzione visualizzazione a colori naturali, associo la posizione della banda al canale colore, applico anche stretch lineare
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #visualizzazione a falsi colori
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") #infrarosso nel verde
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") #infrarosso nel blu

#montare le 4 immagini una dopo l´altra in uno schema multiframe 2x2
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") 

#funzione pdf
pdf("il_mio_primo_pdf_con_R.pdf")
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") 
dev.off()

#stretch histogram
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") #stretch lineare
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist") # streth histogram, ottengo dimensioni frattali nella visualizzazione

#par colori naturali, falsi colori e falsi colori con histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#plot di distribuzione delle specie nello spazio e nel tempo, funzione colorist

install.packages("RStoolbox") #per la pca
library(RStoolbox)

library(raster)
setwd("C:/lab/")
p224r63_2011<-brick("p224r63_2011_masked.grd")
p224r63_2011
#multitemporal set 
p224r63_1988<-brick("p224r63_1988_masked.grd") #funzione brick importa un intero set di bande creando un raster brick (blocco di diversi raster tutti insieme)
p224r63_1988

plot(p224r63_1988) #per visualizzare le singole bande
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin") #plot in colori naturali con stretch lineare
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

#confronto a falsi colori
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#confronto stretch lineare in una riga e stretch hist (funzione logistica con pendenza maggiore) nella seconda riga
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()









