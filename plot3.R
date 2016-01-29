#loading the data sets
install.packages("ggplot2")
library("ggplot2")
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

baltSubset <- summaryData[summaryData$fips=="24510",]
aggregateBalt <- aggregate(Emissions ~ year+type,baltSubset,sum)

#creating the plot
png("plot3.png",width=640,height=480)

g <- ggplot(aggregateBalt,aes(year,Emissions,color=type))
g<- g+geom_line()+xlab("year")+ylab("Total PM2.5 Emission")+ggtitle("PM2.5 Emission in Baltimore based on Type")
print(g)
dev.off()

