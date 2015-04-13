dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir="diet_data.zip")
list.files("diet_data")

andy <- read.csv("diet_data/Andy.csv")

head(andy)

length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)

andy[1, "Weight"] #starting weight
andy[30,"Weight"] #end weight

################## These all do the same thing
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day==30)
##############################################

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss



files_full <- list.files("diet_data", full.names=TRUE)
files_full

head(read.csv(files_full[3]))

andy_david <- rbind(andy, read.csv(files_full[2]))


dat <- data.frame()
for (i in 1:5) {
        dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)

andy_david[andy_david$Day == 25, ]


dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)
#same as
#median(dat$Weight[dat$Day== 30], na.rm=TRUE)

weightMedian <- function(directory, day) {
        
        fileList <- list.files(directory, full.names=TRUE)
        tmp <- vector(mode = "list", length = length(fileList))
        for (iterator in seq_along(fileList))
        {
                tmp[[iterator]] <- read.csv(fileList[[iterator]])
        }
        output <- do.call(rbind, tmp)
        med <- median(output$Weight[dat$Day== day], na.rm=TRUE)
        med        
}

weightMedian(directory = "diet_data", day = 20)
weightMedian(directory = "diet_data", day = 4)
weightMedian(directory = "diet_data", day = 17)
