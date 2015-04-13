# x[order(x$var1, x$var2)]  == arrange(x, var1)

##reverse sort.
#arrange(x, desc(var1))

#ifelse (condition, returnIfTrue, returnIfFalse)


#Create categorical from quantitative 
var = cut(dataSet, breaks=quantile(dataset) )w