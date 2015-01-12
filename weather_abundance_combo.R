
library(reshape)
setwd("~/data")
options(scipen=999)

a14r1 <- read.csv("abundance_14r1.csv")
a14r1 <- a14r1[,c("mean","jdate")]
a14r2 <- read.csv("abundance_14r2.csv")
a14r2 <- a14r2[,c("mean","jdate")]
a14r3 <- read.csv("abundance_14r3.csv")
a14r3 <- a14r3[,c("mean","jdate")]
a14r4 <- read.csv("abundance_14r4.csv")
a14r4 <- a14r4[,c("mean","jdate")]

dat12 <- rbind(a14r1, a14r2)
dat34 <- rbind(a14r3, a14r4)
dat <- rbind(dat12, dat34)

#TMIN = Min Temp (tenths of degree C)
#TMax = Max Temp (tenths of degree C)
#PRCP = tenths of mm of precipitation
#AWND - Average daily wind speed (tenths of meter per second)
#TSUN - Daily total sunshine (minutes)
#WDMV - 24-hour wind movement

wea <- read.csv("2014_weather.csv")
wea <- wea[,2:ncol(wea)]

hour <- read.csv("sunrise_sunset_2014.csv")
hour <- hour[,c("hours","jdate")]

mwea <- melt(wea, id=c("jdate"),na.rm=T)
mdat <- melt(dat, id=c("jdate"),na.rm=T)
mhour <-melt(hour, id=c("jdate"), na.rm=T)

mweaabund <- rbind(mwea, mdat)
mall <- rbind(mweaabund, mhour)

cdat <- cast(data=mall, jdate ~ variable, max, fill=NA_real_)

ggplot()+
  geom_point(data=cdat, aes(x=jdate, y=hours))+
  geom_point(data=cdat, aes(x=jdate, y=mean, colour="red"))
  ylim(0,150)
