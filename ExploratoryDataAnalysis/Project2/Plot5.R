library("ggplot2")
library("dplyr")

#Load the data
nei <- readRDS("data/summaryscc_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

emissionsVehiclesYear <- group_by(subset(nei, fips == "24510" & type == "ON-ROAD"), year)
totalEmissionsVehiclesYear <- summarise(emissionsVehiclesYear, total_emissions = sum(Emissions))

#Create PNG device.
png('figures/plot5.png', width = 800, height = 500, units = 'px')

#Plot total emissions by each year for Baltimore road vehicles.
qplot(year,total_emissions, data = totalEmissionsVehiclesYear, xlab="Year", ylab = (expression('Tons of PM'[2.5])), geom = c("line", "point"), main = c("Baltimore Total Annual Motor Vehicle Emissions (1999 - 2008)"))

#Cleanup.
dev.off()