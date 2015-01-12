#NCEP.gather

library(RNCEP)

temp <- NCEP.gather(variable="air.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
pres <- NCEP.gather(variable="pres.sfc", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
uwind <- NCEP.gather(variable="uwnd.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
vwind <- NCEP.gather(variable="vwnd.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
