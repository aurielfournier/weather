#linear regression

setwd("~/data")
dat <- read.csv("2014_weather_hours_abund.csv")

m1 <- lm(data=dat, mean ~ hours)
m2 <- lm(data=dat, mean ~ jdate)
m3 <- lm(data=dat, mean ~ tempC)
m4 <- lm(data=dat, mean ~ tempF)
m5 <- lm(data=dat, mean ~ vwind)
m6 <- lm(data=dat, mean ~ uwind)
m7 <- lm(data=dat, mean ~ vwind + tempC)
m8 <- lm(data=dat, mean ~ tempC * hours)
m9 <- lm(data=dat, mean ~ vwind * uwind * tempC * hours)
