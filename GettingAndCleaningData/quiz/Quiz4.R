COMUNITIES_URL ='http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
COMUNITIES_DEST= 'comunities.csv'
download.file(COMUNITIES_URL,COMUNITIES_DEST)
comunities <- read.table('comunities.csv', header = T, sep=',', fill=T)
x<- strsplit(names(comunities), 'wgtp')
x[123]


GDP_URL ='http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
GDP_DEST= 'GDP.csv'
download.file(GDP_URL,GDP_DEST)
gdp <- read.table(GDP_DEST, header = F, sep=',', skip = 5, fill=T, quote='"', nrows=190 )
names(gdp) <- c('copuntryCode','Ranking','V1','Name','Economy', 'V2','V3','V4','V5', 'V6')
gdp$Economy <- as.numeric(gsub(',','',gdp$Economy))
mean(gdp$Economy, na.rm=T)

GDP_URL ='http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
GDP_DEST= 'GDP2.csv'
download.file(GDP_URL,GDP_DEST)
gdp <- read.table(GDP_DEST, header = F, sep=',', skip = 5, fill=T, quote='"', nrows=190 )
names(gdp) <- c('CountryCode','Ranking','V1','countryNames','Economy', 'V2','V3','V4','V5', 'V6')
gdp[grep("^United",gdp$countryNames), 4]

GDP_URL ='http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
GDP_DEST= 'GDP2.csv'
download.file(GDP_URL,GDP_DEST)
gdp <- read.table(GDP_DEST, header = F, sep=',', skip = 5, fill=T, quote='"', nrows=190 )
names(gdp) <- c('CountryCode','Ranking','V1','countryNames','Economy', 'V2','V3','V4','V5', 'V6')
gdp$V1 <- gdp$V2 <- gdp$V3 <- gdp$V4 <- gdp$V5 <- gdp$V6 <- NULL
EDU_URL ='http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
EDU_DEST= 'EDU.csv'
download.file(EDU_URL,EDU_DEST)
edu <- read.table(EDU_DEST, header = T, sep=',', fill=T, quote='"')
gdp_edu <- inner_join(gdp, edu, by='CountryCode')
dim(gdp_edu[grep('June', gdp_edu[grep('Fiscal', gdp_edu$Special.Notes), ]$Special.Notes), ])

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
values <- format(sampleTimes, "%a %Y")

length(grep("Mon 2012", values))
