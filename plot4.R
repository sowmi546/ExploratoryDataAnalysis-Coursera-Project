#loading the data sets
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
install.packages("ggplot2")
library(ggplot2)

# merge the two given data sets based on scc
#colnames(scc)

mergedDataSet <- merge(summaryData,scc,by="SCC")

#colnames(mergedDataSet)
coalRelated <- grepl("coal",mergedDataSet$Short.Name,ignore.case=TRUE)
subsetData <- mergedDataSet[coalRelated,]

aggByYear <- aggregate(Emissions ~ year, subsetData,sum)

#creating the plot
png("plot4.png",width=640,height=480)
g<-ggplot(aggByYear,aes(factor(year),Emissions))

g<-g+geom_bar(stat="identity")+xlab("year")+ylab("Total PM2.5 Emissions")+ggtitle("Emissions from coal from 1999 to 2008")

print(g)
dev.off()
