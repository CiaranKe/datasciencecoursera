install.packages("RMySQL")
#user: genome 
#host: genome-mysql.csm.ucsc.edu
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu", db="hg19")
#result <- dbGetQuery(ucscDb, "show databases;"); 
#allTables <- dbListTables(ucscDb)
#allFields <- dbListFields(ucscDb, "affyU133Plus2")
#rowcount <- dbGetQuery(ucscDb, "select count(*) from affyU133Plus2")
#affyData <- dbReadTable(ucscDb, "affyU133Plus2")
query <- dbSendQuery(ucscDb, "select * from affyU133Plus2 where misMatches between 1 and 3")
#affyMis <- fetch(query);
affyMis <- fetch(query, n=10);
quantile(affyMis)
dbClearResult(query)
dim(affyMis)
dbDisconnect(ucscDb)
