corr <- function(directory, threshold = 0) {
        completeCases <- complete("specdata")
        completeIDs <- completeCases[completeCases$nobs > threshold, ]$id
        result = numeric()
        for (iterator in completeIDs) {
               data <- read.csv(paste(directory, "/", formatC(iterator, width = 3, 
                                                flag = "0"), ".csv", sep = ""))
               completeData <- data[complete.cases(data), ]
               cor <- cor(completeData$nitrate, completeData$sulfate)
               result <- c(result, cor)
        }
        result
}
