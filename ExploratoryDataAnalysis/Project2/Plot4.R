library("ggplot2")
library("dplyr")

#Load the data
nei <- readRDS("data/summaryscc_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

coalEmissionCodes <- scc[grep("coal", scc$Short.Name, ignore.case = TRUE), ]
coalEmissionsYear <- group_by(merge(x = nei, y = coalEmissionCodes, by = c("SCC")),year)

#Total emissions in kilotons per year for coal pollutants.
totalCoalEmissionsYear <- mutate(summarise(coalEmissionsYear, total_emissions = sum(Emissions)),total_emissions_kilotons = total_emissions/1000)

#Create PNG device.
png('figures/plot4.png', width = 800, height = 500, units = 'px')

#Plot total emissions per year for coal emissions.
qplot(year,total_emissions_kilotons, data = totalCoalEmissionsYear, xlab="Year", ylab = (expression('Kilotons of PM'[2.5])), geom = c("line", "point"), main = c("US Total Annual Coal Emissions (1999 - 2008)"))

#Cleanup.
dev.off()