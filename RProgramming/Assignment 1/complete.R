complete <- function(directory, id = 1:332) {
        fileList <- list.files(directory, full.names=TRUE)[id]
        fileList
        data <- data.frame(id=numeric(),nobs=numeric())
        for (iterator in seq_along(fileList))
        {
                tempData <- read.csv(fileList[[iterator]])        
                data <- rbind(data, data.frame(
                                id=id[iterator], 
                                nobs=nrow(tempData[complete.cases(tempData), ]))) 
        }      
        data
}