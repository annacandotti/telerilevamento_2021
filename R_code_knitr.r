#R_code_knitr.r
setwd("C:/lab/")
require(knitr)
stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr")) #per generare un report con grafici che viene salvato nella cartella da cui prende il codice
