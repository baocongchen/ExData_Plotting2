#Load data
data<-readRDS("summarySCC_PM25.rds")
classcode<-readRDS("Source_Classification_Code.rds")

# Extract Coal Data & Prepare
coalclass <- subset(classcode, grepl("Combustion", SCC.Level.One) & 
                    grepl("Coal", SCC.Level.Three))
coaldata <- subset(data, data$SCC %in% coalclass$SCC)

#Open device
png("plot4.png")
#Plot data
qplot(year, Emissions, data=coaldata, geom=c("smooth"), 
           method="lm", ylab="Coal Emissions") 
#Turn off device
dev.off()
