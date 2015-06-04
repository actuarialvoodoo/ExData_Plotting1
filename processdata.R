data.address<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data.folder<- "data"
zip.file<-"exdata-data-household_power_consumption.zip"
data.file<-"household_power_consumption.txt"
sql.query<-"SELECT * FROM powerdata WHERE Date in ('1/2/2007','2/2/2007')"

setwd("/Users/rthomas/Documents/Coursera/Exploratory Data Analysis/project")

if (!file.exists(data.folder)){
     dir.create(data.folder)
}

if (!file.exists(file.path(data.folder,zip.file))){
     download.file(data.address,file.path(data.folder,zip.file), method="curl")
}

library(sqldf)
powerdata<-file(file.path(data.folder,data.file),open="r")
powerdf<-sqldf(sql.query,file.format=list(header=TRUE,sep=";"))
#mydf<-sqldf()
close(powerdata)
powerdf<-unite(powerdf,readingtime,Date:Time,sep=" ")
#powerdf$readingtime<-strptime(powerdf$readingtime,"%Y-%m-%d %H:%M:%S")