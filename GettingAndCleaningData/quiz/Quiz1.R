download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "FUMdata.csv")
FUmData <- read.csv(file="FUMdata.csv", header=TRUE)
str(FUmData)
length(FUmData$VAL[FUmData$VAL >=24 & !is.na(FUmData$VAL)])

install.packages("xlsx")
library("xlsx")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "NGAP.xlsx")

colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx(file="NGAP.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
# write.xlsx()
str(dat)
sum(dat$Zip*dat$Ext,na.rm=T) 

install.packages("XML")
library(XML)
xmlDoc <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(xmlDoc)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[2]]
xmlSApply(rootNode[[1]][[1]], xmlValue)

zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zips[zips == "21231"])

install.packages("jsonlite")
library(jsonlite)

jsonData <- fromJSON("https://api.github.com/users/CiaranKearney/repos")
names(jsonData)
jsonData$name
data(iris)
irisJSON <- toJSON(iris, pretty=T)
cat(irisJSON)

install.packages("data.table")
library(data.table)

DF<- data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT<- data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))

DT[2,]
DT[2]
DT[,2]
DT[,list(mean(x),sum(z))]
DT[,table(y)]
DT[DT$y=="a",]
##add a new col
DT[,w:=z^2]
DT

##keys
DT2 <- data.table(x=sample(letters[1:3], 1E5, TRUE),y=rnorm(100000) )
DT2[, .N, by=x]
setkey(DT2,x)
DT2['a']

##joins
DT3 <- data.table(x=c('a','a','b','dt1'), y=1:4)
setkey(DT3,x)
merge(DT2,DT3)



download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "pid.csv")
DT <- fread("pid.csv")

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])