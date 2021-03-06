#loading the data sets
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all
#sources for each of the years 1999, 2002, 2005, and 2008.

aggTotalByYear <- aggregate(Emissions ~ year,summaryData,sum)

#creating the plot
png('plot1.png')
barplot(height=aggTotalByYear$Emissions,names.arg=aggTotalByYear$year,xlab="years",ylab="Total PM2.5 emissions",main="Total PM2.5 emissions in various given years")
dev.off()
