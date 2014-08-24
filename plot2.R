#Load data
data<-readRDS("summarySCC_PM25.rds")
#Filter data
Maryland<-data[data$fips=="24510",]
#Set data
emissionsPerYear<-rowsum(Maryland$Emissions, Maryland$year)
#Turn on device
png("plot2.png")
#Plot data
plot(rownames(emissionsPerYear), emissionsPerYear, xlab="Year", ylab="Total Emisssions", type="l")
#Turn off device
dev.off()
