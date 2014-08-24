#Load data
data<-readRDS("summarySCC_PM25.rds")

emissionsPerYear<-rowsum(data$Emissions, data$year)
#Turn on device
png("plot1.png")
#Plot data
plot(rownames(emissionsPerYear), emissionsPerYear, xlab="Year", ylab="Total Emisssions", type="l")
#Turn off device
dev.off()
