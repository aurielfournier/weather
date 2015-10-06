library(RNCEP)

v100012 <- NCEP.gather("vwnd", 1000, c(8,10), c(2012,2012),c(36,41),c(87,97))
vdf100012 <- NCEP.array2df(v100012, var.names="vwnd")
# negative v = southern
# positive v = northern
u100012 <- NCEP.gather("uwnd", 1000, c(8,10), c(2012,2012),c(36,41),c(87,97))
udf100012 <- NCEP.array2df(u100012, var.names="uwnd")
# positive u = eastern
# negative u = western
v100013 <- NCEP.gather("vwnd", 1000, c(8,10), c(2013,2013),c(36,41),c(87,97))
vdf100013 <- NCEP.array2df(v100013, var.names="vwnd")
# negative v = southern
# positive v = northern
u100013 <- NCEP.gather("uwnd", 1000, c(8,10), c(2013,2013),c(36,41),c(87,97))
udf100013 <- NCEP.array2df(u100013, var.names="uwnd")
# positive u = eastern
# negative u = western
v100014 <- NCEP.gather("vwnd", 1000, c(8,10), c(2014,2014),c(36,41),c(87,97))
vdf100014 <- NCEP.array2df(v100014, var.names="vwnd")
# negative v = southern
# positive v = northern
u100014 <- NCEP.gather("uwnd", 1000, c(8,10), c(2014,2014),c(36,41),c(87,97))
udf100014 <- NCEP.array2df(u100014, var.names="uwnd")
# positive u = eastern
# negative u = western
v100015 <- NCEP.gather("vwnd", 1000, c(8,9), c(2015,2015),c(36,41),c(87,97))
vdf100015 <- NCEP.array2df(v100015, var.names="vwnd")
# negative v = southern
# positive v = northern
u100015 <- NCEP.gather("uwnd", 1000, c(8,9), c(2015,2015),c(36,41),c(87,97))
udf100015 <- NCEP.array2df(u100015, var.names="uwnd")
# positive u = eastern
# negative u = western


u1000 <- rbind(udf100012, udf100013, udf100014, udf100015)
v1000 <- rbind(vdf100012, vdf100013, vdf100014, vdf100015)

write.csv(v1000, "~/data/vwnd_1000.csv")
write.csv(u1000, "~/data/uwnd_1000.csv")
