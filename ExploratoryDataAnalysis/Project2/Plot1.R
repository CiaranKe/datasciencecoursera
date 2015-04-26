library("dplyr")

#Load the data
nei <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

#Sum the emissions per year for all states
emissionsByYear <- group_by(nei, year)
totalEmissionsByYear <- summarise(emissionsByYear, totalEmissions = sum(Emissions))

#Create PNG device
png('figures/plot1.png', width = 800, height = 500, units = 'px')

#Create the graph
with(totalEmissionsByYear, plot(year, (totalEmissions/1000), main = "US Total Annual Emissions (1999 - 2008)", ylab = (expression('Kilotons of PM'[2.5])), xlab = "Year", type = "b"))

#Cleanup
dev.off()