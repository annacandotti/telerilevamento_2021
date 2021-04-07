# time series analysis
# Greenland increase of temperature
# data and code from Emanuela Cosma

library(raster)
setwd("C:/lab/greenland")
lst_2000<-raster("lst_2000.tif") #importo il dataset
plot(lst_2000) #per visualizzare l´immagine
lst_2005<-raster("lst_2005.tif")
plot(lst_2005)
lst_2010<-raster("lst_2010.tif")
plot(lst_2010)
lst_2015<-raster("lst_2015.tif")
plot(lst_2015)

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#per non importare ogni singolo file manualmente creo una lista
rlist <-list.files(pattern="lst") #list.files crea una lista per poi applicare la funzione lapply, il pattern spiega quali file cercare in base al nome, associo un oggetto
rlist
import <- lapply(rlist,raster) #funzione lapply per applicare una funzione (qui raster) ad una lista di file che ho chiamato rlist #applico la funzione raster a tutta la lista #associo il nome
import #importo e visualizzo i quattro file
TGr <- stack(import) #con la funzione stack costruisco un pacchetto di file raster (rasterstack) con nome 
plot(TGr) #plotto direttamente tutto il file
