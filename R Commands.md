##Help
* help.search("Term")

##Get a list of packages
* a <- available.packages()
* head(rownames(a), 3) #First three packages

##Install a packages 
###Auto dependencies 
* install.package("packageName")
* install.package(c("one", "two", "three"))