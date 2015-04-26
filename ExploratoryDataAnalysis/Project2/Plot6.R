library("ggplot2")
library("dplyr")

#Load the data
nei <- readRDS("data/summaryscc_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

#Subset the Maryland vehicles
emissionsVehiclesYearBaltimore <- group_by(subset(nei, fips == "24510" & type == "ON-ROAD"), year)
totalEmissionsVehiclesYearBaltimore <- summarise(emissionsVehiclesYearBaltimore, total_emissions = sum(Emissions))
totalEmissionsVehiclesYearBaltimore$state <- "Baltimore"

#Subset the California vehicles
emissionsVehiclesYearCalifornia <- group_by(subset(nei, fips == "06037" & type == "ON-ROAD"), year)
totalEmissionsVehiclesYearCalifornia <- summarise(emissionsVehiclesYearCalifornia, total_emissions = sum(Emissions))
totalEmissionsVehiclesYearCalifornia$state <- "Los Angeles"

#Combine the subsets
totalEmissionsVehiclesYear <- rbind(totalEmissionsVehiclesYearBaltimore,totalEmissionsVehiclesYearCalifornia)

#Create PNG device
png('figures/plot6.png', width = 800, height = 500, units = 'px')

#Create the plot
ggplot(data = totalEmissionsVehiclesYear, aes(x = year, y = total_emissions)) + geom_line(aes(group = 1, col = total_emissions)) + guides(fill = F) + ggtitle('Los Angeles & Baltimore Total Vehicle Emissions (1999 - 2008)') + ylab(expression('Tons of PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ state) + geom_text(aes(label = round(total_emissions, 0), size = 1, hjust = 0.5, vjust = -1))

#Cleanup
dev.off()