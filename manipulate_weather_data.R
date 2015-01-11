# manipulating the raw weather data

setwd("~/data")

dat <- read.csv('455643.csv')
names <- colnames(dat)
names <- tolower(names)
colnames(dat) <- names
dat$year <- as.numeric(substr(dat$date, start=1, stop=4))
dat$month <- as.numeric(substr(dat$date, start=5, stop=6))
dat$day <- as.numeric(substr(dat$date, start=7, stop=8))

dat <- dat[dat$year==2014,]


dats <- dat[,c("month","day","year")]


varmonth<-cbind(c(1:12),c(0,31,59,90,120,151,181,212,243,273,304,334))
juldates<-data.frame(jdate=as.numeric())
for(i in 1:nrow(dats)) {juldates[i,1]<-varmonth[which(dats[i,1]==varmonth[,1]),2]+dats[i,2]
                         
}

dat$jdate <- juldates
