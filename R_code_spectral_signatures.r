#R_code_spectral_signatures.r

library(raster)
library(rgdal)
setwd("C:/lab")

defor2 <- brick("defor2.jpg")

#defor2.1, defor2.2, defor2.3
#nir, red, green

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="hist") #con curva logistica, sorta di integrale con differenze piu accentuate all´interno dell´immagine

#funzione per le firme spettrali: click, cliccando sulla mappa ottengo le info di riflettanza per banda per pixel 
#oggetto file mappa
#stabilire se creare un id per ogni punto, T=true=yes
#xy per utilizzare queste info spaziali
#info per ogni cella=pixel
#tipo per punti
#pch point character, il 16 pallino chiuso
#cex= character exageration
#colore
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#dataframe con ad esempio banda, valore riflettanza foresta, valore riflettanza agricola
#storage dei dati con ad esempio 3 bande
#definizione delle colonne del dataset: prima colonna: banda,
band <- c(1,2,3)
#seconda colonna con valore di riflettanza della foresta che ho ricavato dal click
forest <- c(206,6,19) 
#terza colonna con valore di riflettanza dell´acqua
water <- c(40,99,139)

#creazione della tabella = dataframe
spectrals <- data.frame(band, forest, water)

#plot del dataset:
#output del plot
#aesthetics: la x corrisponde all´asse x nel grafico in cui voglio collocare le bande, mentre sull´asse y la riflettanza: una per la foresta e una per l´acqua
#con il + si aggiungono le geometrie
ggplot(spectrals, aes(x=band)) +
      geom_line(aes(y = forest), color = "green")+
      geom_line(aes(y = water), color = "blue", linetype = "dotted") +
      labs(x="wavelength", y="reflectance")

#analisi multitemporale sulla stessa zona/pixel:
defor1 <- brick("defor1.pjg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
#firme spettrali di defo1 con la funzione click
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")
#clicco sui pixel che mi interessano e ottengo i valori in output
#c´è anche una funzione per pixel randomizzati: random_points o extract con tutti i dati 

#stessa cosa con defor2
defor2 <- brick("defor2.pjg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#definisco le colonne del dataset e leggo i valori di riflettanza per pixel dai risultati della funzione click
band <- c(1,2,3)
time1 <- c(223,11,33)
time1pixel2 <- c(218, 16,38)
time2 <- c(197, 163, 151)
time2pixel2 <- c(149, 157, 133)

spectralst <- data.frame(band, time1, time2)

#plot
ggplot(spectrals, aes(x=band)) +
      geom_line(aes(y = time1), color = "green")+
      geom_line(aes(y = time2), color = "blue", linetype = "dotted") +
      geom_line(aes(y = time1pixel2), color = "red")+
      geom_line(aes(y = time2pixel2), color = "grey")+
      labs(x="wavelength", y="reflectance")

 


