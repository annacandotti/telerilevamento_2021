#R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)
setwd("C:/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2) #plot di due bande
pairs(p224r63_2011) #mette in correlazione a coppie tutte le variabili del dataset(qui le bande)
