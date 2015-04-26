#Load the data
nei <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Subset the data 
MD <- subset(nei, fips == '24510')

#Open PNG device
png(filename = 'figures/plot2a.png')

#create the bar plot
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))

#Close device.
dev.off()