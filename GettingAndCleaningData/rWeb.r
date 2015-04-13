con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=1)
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)

library(httr)
html2 = GET(url)
#google = handle("http://google.com")
#authenticate("user", "password")
content2 = content(html2,as="text")
parsedHTML = htmlParse(content2,asText=T)
xpathSApply(parsedHTML, "//title", xmlValue)
