NEI <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#  Create Plot Data from Vehicle Emissions in Baltimore City
Vehicle<- grep("vehicle",scc$EI.Sector,value=T,ignore.case=TRUE)
scc.VEH <- subset(scc, scc$EI.Sector %in% Vehicle, select=SCC)
Baltimore <- subset(NEI, fips == "24510")
NEI.VEH <- subset(Baltimore, Baltimore$SCC %in%  scc.VEH$SCC)
data <- aggregate(NEI.VEH[c("Emissions")], list(year = NEI.VEH$year), sum)


library(ggplot2)
#Open device
png('plot5.png', width=480, height=480)
#Plot data
plot(data$year, data$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore City",
     xlab = "Year", ylab = "Emissions")
#Turn off device
dev.off()

