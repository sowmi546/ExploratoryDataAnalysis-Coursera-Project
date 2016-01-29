#loading data sets
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
install.packages("ggplot2")

library(ggplot2)
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles #County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

# merge the two given data sets based on scc

mergedDataSet <- merge(summaryData,scc,by="SCC")

#fips for Baltimore is 24510 and that of LA is 06037
#colnames(mergedDataSet)

subsetData <- mergedDataSet[(mergedDataSet$fips=="24510"| mergedDataSet$fips=="06037") & mergedDataSet$type=="ON-ROAD",]

aggDataSet <- aggregate(Emissions ~ year+fips,subsetData,sum)
#replacing the fips values with string values of baltimore and LA
aggDataSet$fips[aggDataSet$fips=="24510"] <- "Baltimore, MD"
aggDataSet$fips[aggDataSet$fips=="06037"] <- "Los Angeles, CA"


#creating the plot
png("plot6.png",width=1040,height=480)
g<-ggplot(aggDataSet,aes(factor(year),Emissions))
g<-g+facet_grid(. ~ fips)
g<-g+geom_bar(stat="identity")+xlab("year")+ylab("Total PM2.5 Emissions")+ggtitle("Emissions from motor vehicles in Baltimore and LA from 1999 to 2008")

print(g)
dev.off()
