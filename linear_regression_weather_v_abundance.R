#linear regression

setwd("~/data")
dat <- read.csv("2014_weather_hours_abund.csv")

m1 <- glm(data=dat, mean ~ hours)
m2 <- glm(data=dat, mean ~ jdate)
m3 <- glm(data=dat, mean ~ tmax)
m4 <- glm(data=dat, mean ~ tmin)
m5 <- glm(data=dat, mean ~ prcp)
