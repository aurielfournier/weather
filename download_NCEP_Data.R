#NCEP.gather

library(RNCEP)

#temp is in K
temp <- NCEP.gather(variable="air.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
#pres is in Pascals
pres <- NCEP.gather(variable="pres.sfc", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
# wind is in m/s
uwind <- NCEP.gather(variable="uwnd.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)
vwind <- NCEP.gather(variable="vwnd.sig995", level="surface", months.minmax=c(8:11), years.minmax=c(2014,2014), lat.southnorth=c(35,41),lon.westeast=c(-96,-89),status.bar=T)


df <- NCEP.array2df(wx.data=list(temp,pres,uwind, vwind), var.names=c('temp','pres','uwind','vwind'))

df$tempC <- df$temp-273.15
df$tempF <- (df$tempC*1.800)+32
df$day <- as.numeric(substr(df$datetime, start=9, stop=10))
df$month <- as.numeric(substr(df$datetime, start=6, stop=7))
df$year <- as.numeric(substr(df$datetime, start=1, stop=4))


dats <- df[,c("month","day","year")]


varmonth<-cbind(c(1:12),c(0,31,59,90,120,151,181,212,243,273,304,334))
juldates<-data.frame(jdate=as.numeric())
for(i in 1:nrow(dats)) {juldates[i,1]<-varmonth[which(dats[i,1]==varmonth[,1]),2]+dats[i,2]
                        
}

df$jdate <- juldates$jdate

write.csv(df, "2014_fall_NCEP.csv")
