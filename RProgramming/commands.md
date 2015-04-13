## getwd() get working dir
##setwd("path")  set working dir
## dir() list dir contents
## ls() list functions
## source("file") load functions


mean(na.omit(table[table$Ozone>31&table$Temp>90,])$Solar.R)
mean(table[table$Month ==6,]$Temp)
