

setwd("~/data")

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

wea <- read.csv("2014_weather.csv")
