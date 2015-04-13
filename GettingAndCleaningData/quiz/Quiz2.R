library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", "X", secret="X")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
#set callback to http://localhost:1410
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2$created_at[json2$name=="datasharing"]

library(sqldf)
acs <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
unique(acs$AGEP) 
sqldf("select distinct AGEP from acs")

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
c(nchar(htmlCode[10]), nchar(htmlCode[20]),nchar(htmlCode[30]),nchar(htmlCode[100]))



x <- <- read.fwf(
        file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
        widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
        skip=4)
head(x)
sum(as.numeric(x$V4))
head(x)
str(x)