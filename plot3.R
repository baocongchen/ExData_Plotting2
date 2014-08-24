library("ggplot2")

## Loading Data--This first line will likely take a few seconds.
PM2.5 <- readRDS("summarySCC_PM25.rds")

# Extract data 
data <- subset(PM2.5, PM2.5$fips == 24510)
emissionsPerType <- aggregate(data$Emissions, by = list(data$year, data$type), 
                              FUN = "sum")
names(emissionsPerType) <- c("Year", "Type", "Emissions")
#Open device
png("plot3.png")
#Plot
qplot(data = emissionsPerType, x=Year, y=Emissions, col=Type, geom = "line")
#Turn off device
dev.off()
