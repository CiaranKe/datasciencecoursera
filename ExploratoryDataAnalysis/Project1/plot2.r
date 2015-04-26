chartData <- getChartData()
png(filename="plot2.png", width = 480, height = 480, bg="white")
plot(Global_active_power ~ DateTime, chartData, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
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