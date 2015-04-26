chartData <- getChartData()
png(filename="plot3.png", width = 480, height = 480, bg="white")
plot(Sub_metering_1 ~ DateTime,chartData, type="n", ylab="Energy sub metering", xlab="")
points(Sub_metering_1 ~ DateTime,chartData, type="l", col="black")
points(Sub_metering_2 ~ DateTime,chartData, type="l", col="red")
points(Sub_metering_3 ~ DateTime,chartData, type="l", col="blue")
legend("topright",lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )       
dev.off()

getChartData <- function() {
        URL<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        ZIP_FILE <- "hpc.zip"
        HPC_FILE <- "household_power_consumption.txt"
        download.file(URL,ZIP_FILE)
        unzip(ZIP_FILE)
        rawData <- read.csv(HPC_FILE, sep=";", stringsAsFactors=F, na.strings="?")
        rawData$DateTime <- as.POSIXct(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")
        rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
        rawData$Time <- as.POSIXct(strptime(rawData$Time, "%H:%M:%S"))
        chartData <- subset(rawData, Date > as.Date("31/01/2007", "%d/%m/%Y") & Date < as.Date("03/02/2007", "%d/%m/%Y"))
        chartData
}