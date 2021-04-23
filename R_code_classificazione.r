#classificazione non supervisionata solar orbiter
setwd("C:/lab")
library(raster)
library(RStoolbox)
so<-brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1,2,3, stretch="lin") #visualizzazione RGB levels 3 livelli energetici 
soc <- unsuperClass(so, nClasses=3) #classificazione non supervisionata con 3 classi
plot(soc$map)
set.seed(42) #per fare in modo che la classificazione venga elaborata sempre allo stesso modo, stesso numero random di training sites
cl <- colorRampPalette(c("yellow", "black", "red"))(100)
plot(soc20$map, col=cl)

#Grand Canyon
library(raster)
library(RStoolbox)
setwd("C:/lab")

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
plot(gcc2$map)
gcc4 <- unsuperClass(gc, nClasses=4)
gcc4
plot(gcc4$map)






