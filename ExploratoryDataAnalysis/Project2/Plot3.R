library("ggplot2")
library("dplyr")

#Load the data
nei <- readRDS("data/summaryscc_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

#Extract a subset of data for Baltimore only, group by both year and type
emissionsByYearType <- group_by(subset(nei, fips == "24510", select = c(Emissions, year, type)), year, type)

# Calculate the  total emissions for each year and type.
totalEmissionsByYearType <- summarise(emissionsByYearType, totalEmissions = sum(Emissions))

# Create PNG device.
png('figures/plot3.png', width = 800, height = 500, units = 'px')

# Plot four lines and points for each of the four types, displaying total emissions for each year.
qplot(year,totalEmissions, data = totalEmissionsByYearType, color = type, xlab="Year", ylab = (expression('Tons of PM'[2.5])), geom = c("line", "point"), main = c("Baltimore Total Annual Emissions by Type (1999 - 2008)"))

# Cleanup.
dev.off()