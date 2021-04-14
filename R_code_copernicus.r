#R_code_copernicus.r #global fcover

install.packages("raster")
library(raster)
install.packages("ncdf4")
library(ncdf4) #per leggere il formato di dati con estensione .nc

setwd("C:/lab/")
fcover_19 <- raster("c_gls_FCOVER-RT6_201906200000_GLOBE_PROBAV_V2.0.1.nc")
cl <- colorRampPalette(c("red", "orange", "yellow", "green"))(100)
plot(fcover_19, col=cl)

#ricampionamento bilineare attraverso la media
fcover_19res <- aggregate(fcover_19, fact=100) #funzione per ridurre il numero complessivo di pixel #ricampionamento su variabile originale con fattore 100
plot(fcover_19res, col=cl)
