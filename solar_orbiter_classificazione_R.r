#classificazione non supervisionata solar orbiter
setwd("C:/lab")
library(raster)
library(RStoolbox)
so<-brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1,2,3, stretch="lin") #visualizzazione RGB levels 3 livelli energetici 
soc <- unsuperClass(so, nClasses=3) #classificazione non supervisionata con 3 classi
plot(soc$map)
set.seed(42) #per fare in modo che la classificazione venga elaborata sempre allo stesso modo, stesso numero random di training sites



