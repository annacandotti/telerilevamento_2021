#classificazione non supervisionata solar orbiter
setwd("C:/lab")
library(raster)
so<-brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1,2,3, stretch="lin") #3 livelli energetici

