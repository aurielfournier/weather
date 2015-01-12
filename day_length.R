# figuring out day length

library(StreamMetabolism)

latlong <- data.frame(name=c("NVCA","FGCA","CCNWR","OSCA"),lat=c(40.0915, 39.702710, 39.26610, 36.722), long=c(-95.054, -93.313, -90.781,-90.107))

nw <- sunrise.set(latlong[1,2], latlong[1,3], date="2014/08/01", timezone="America/Chicago", num.days=95)
nc <- sunrise.set(latlong[2,2], latlong[2,3], date="2014/08/01", timezone="America/Chicago", num.days=95)
ne <- sunrise.set(latlong[3,2], latlong[3,3], date="2014/08/01", timezone="America/Chicago", num.days=95)
se <- sunrise.set(latlong[4,2], latlong[4,3], date="2014/08/01", timezone="America/Chicago", num.days=95)

nw$region <- "nw"
nc$region <- "nc"
ne$region <- "ne"
se$region <- "se"

nwnc <- rbind(nw, nc)
nese <- rbind(ne, se)
reg <- rbind(nwnc,nese)

reg$sunrise.time <- substr(reg$sunrise, start=12, stop=19)
reg$sunrise.date <- substr(reg$sunrise, start=1, stop=11)
reg$sunset.time <- substr(reg$sunset, start=12, stop=19)
reg$sunset.date <- substr(reg$sunset, start=1, stop=11)

reg$hours <- reg$sunset -reg$sunrise

d <- as.data.frame(matrix(nrow=380, ncol=1))
d$month <- as.numeric(substr(reg$sunrise.date, start=6, stop=7))
d$day <- as.numeric(substr(reg$sunrise.date, start=9, stop=10))
d$year <- as.numeric(substr(reg$sunrise.date, start=1, stop=4))
d <- d[,2:4]

varmonth<-cbind(c(1:12),c(0,31,59,90,120,151,181,212,243,273,304,334))
juldates<-data.frame(date=as.numeric())
for(i in 1:nrow(d)) {juldates[i,1]<-varmonth[which(d[i,1]==varmonth[,1]),2]+d[i,2]
                         
}

reg$jdate <- juldates$date

write.csv(reg, "sunrise_sunset_2014.csv")
