NEI <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#  Create Plot Data from Vehicle Emissions in Baltimore and Los Angeles
Vehicle<- grep("vehicle",scc$EI.Sector,value=T,ignore.case=TRUE)
scc.VEH <- subset(scc, scc$EI.Sector %in% Vehicle, select=SCC)
B.Los <- subset(NEI, fips == "24510"|fips == "06037")
NEI.VEH <- subset(B.Los, B.Los$SCC %in%  scc.VEH$SCC)
data <- aggregate(NEI.VEH[c("Emissions")], list(fips = NEI.VEH$fips, year = NEI.VEH$year), sum)
data$city <- rep(NA, nrow(data))
data[data$fips == "06037", ][, "city"] <- "Los Angeles County"
data[data$fips == "24510", ][, "city"] <- "Baltimore City"


#Load library
library(ggplot2)
#Open device 
png('plot6.png', width=480, height=480)
#Plot data
myplot <-ggplot(data, aes(x=year, y=Emissions, colour=city)) +
geom_point() +  geom_smooth(alpha=.2, size=2, method="loess") +
ggtitle("PM2.5 Emissions in Baltimore and LA")
print(myplot)
#Turn off device
dev.off()

