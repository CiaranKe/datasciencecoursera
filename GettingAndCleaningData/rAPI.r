
#twitter
library(httr)
library(RJSONIO)
myapp = oauth_app("twitter", key="X", secret="X")
sig = sign_oauth1.0(myapp, token="X", token_secret="X")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))

?connections
#read.arff()
##EBImage from bioconductor.