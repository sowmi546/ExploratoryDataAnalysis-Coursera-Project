#loading the data sets
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
install.packages("ggplot2")
library(ggplot2)

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# merge the two given data sets based on scc

mergedDataSet <- merge(summaryData,scc,by="SCC")

#colnames(mergedDataSet)
#coalRelated <- grepl("motor",mergedDataSet$Short.Name,ignore.case=TRUE)
#subsetData <- mergedDataSet[coalRelated,]
#colnames(mergedDataSet)
subsetData2 <- mergedDataSet[mergedDataSet$fips=="24510" & mergedDataSet$type=="ON-ROAD",]

aggByYear <- aggregate(Emissions ~ year, subsetData2,sum)

#creating the plot
png("plot5.png",width=640,height=480)
g<-ggplot(aggByYear,aes(factor(year),Emissions))

g<-g+geom_bar(stat="identity")+xlab("year")+ylab("Total PM2.5 Emissions")+ggtitle("Emissions from motor vehicles from 1999 to 2008")

print(g)
dev.off()
