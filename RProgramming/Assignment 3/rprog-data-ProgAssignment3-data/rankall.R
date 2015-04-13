rankall <- function(outcome, num = "best") {
        ## Read outcome data
        all <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- subset(all[, c(2,7,11,17,23)])
        names(data) <- c("Name", "State", "Attack", "Failure", "Pneumonia")
        col <- 0
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
        
        list <- split(data, data$State)
        found <- lapply(list, function(listData){
                listData[,col] <- suppressWarnings(as.numeric(listData[,col]))
                listData <- listData[order(listData[,col], listData[,1], na.last=NA),]
                if (num == "best") {
                        c(listData[1,1], listData[1,2])
                }
                else if (num == "worst") {
                        c(listData[nrow(listData), 1],listData[1,2])
                }
                else {
                        c(listData[num, 1], listData[1,2])
                }
        })
        results <- data.frame(matrix(unlist(found), ncol=2, byrow=T))
        names(results) <- c("hospital", "state")
        results
}