best <- function(state, outcome) {
        all <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- subset(all[, c(2,7,11,17,23)])
        col <- 0 
        if (!(state %in% data[,2])) {
                stop("invalid state")
        }
        else {
                data <- data[which(data[,2] == state),]                
        }
        if ((outcome == "heart attack")) {
                col <- 3                
        }
        else if ((outcome == "heart failure")) {
                col <- 4
        }
        else if ((outcome == "pneumonia")) {
                col <- 5
        }
        else {
                stop("invalid outcome")
        }
        data[,col] <- suppressWarnings(as.numeric(data[,col]))
        row <- which(data[,col]== min(data[,col], na.rm = TRUE))
        data[row, 1]
}