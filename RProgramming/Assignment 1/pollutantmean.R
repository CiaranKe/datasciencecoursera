#
# Calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors
#
pollutantmean <- function(directory, pollutant, id = 1:332) {
        fileList <- list.files(directory, full.names=TRUE)[id]
        tmp <- vector(mode = "list", length = length(fileList))
        for (iterator in seq_along(fileList))
        {
                tmp[[iterator]] <- read.csv(fileList[[iterator]])
        }
        data <- do.call(rbind, tmp)
        round(mean(data[[pollutant]], na.rm=TRUE),3)
 }