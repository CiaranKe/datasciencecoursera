rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        all <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- subset(all[, c(2,7,11,17,23)])
        names(data) <- c("Name", "State", "Attack", "Failure", "Pneumonia")
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
        data <- data[order(data[,col], data[,1], na.last=NA),]
        
        if (num == "best") {
                data[1,1]
        }
        else if (num == "worst") {
                data[nrow(data), 1]
        }
        else {
                data[num, 1]
        }
}