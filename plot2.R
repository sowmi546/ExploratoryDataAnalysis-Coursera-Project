#loading the data sets
summaryData <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

baltimoreSub <- summaryData[summaryData$fips=="24510",]
aggBaltimore <- aggregate(Emissions ~ year, baltimoreSub,sum)
#creating the plot
png('plot2.png')
barplot(height=aggBaltimore$Emissions,names.arg=aggBaltimore$year,xlab="years",ylab="PM2.5Emissions total in Baltimore",main="Total PM2.5 Emissions in 4 different years in Baltimore")
dev.off()
