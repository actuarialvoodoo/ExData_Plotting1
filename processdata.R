data.address<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data.folder<- "data"
zip.file<-"exdata-data-household_power_consumption.zip"
data.file<-"household_power_consumption.txt"

powerdata<-unz(file.path(data.folder,zip.file),data.file)
attr(powerdata,"file.format")<-list(sep=";",header=TRUE)

mydf<-sqldf("SELECT * FROM powerdata WHERE Date in ('2007-02-01','2007-02-02')")
