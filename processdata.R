## processdata.R
#
#  This script performs the data preprocessing and creates the powerdf
#  which is used to create the png graphs in this project

## ASSUMPTIONS
# 
#  This script was written to work on a mac, and therefore I have used method="curl" for the 
#  download.file function. If you rerun this script on another o/s you may need to
#  change this option
#
#  This script should be run after you have set the working direcotry equal to the directory 
#  you would like to use for the analysis

## CONFIG
data.address<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data.folder<- "data"
zip.file<-"exdata-data-household_power_consumption.zip"
data.file<-"household_power_consumption.txt"
sql.query<-"SELECT * FROM powerdata WHERE Date in ('1/2/2007','2/2/2007')"


## END CONFIG

# Check to see if powerdf is a defined object and create it if not
if (sum(ls()=="powerdf") == 0){ 
     library(tidyr)
     library(sqldf)
     
     if (!file.exists(data.folder)){
          dir.create(data.folder)
          download.file(data.address,file.path(data.folder,zip.file), method="curl")
          unzip(file.path(data.folder,zip.file))
     }else{
     
          if (!file.exists(file.path(data.folder,zip.file))){
               download.file(data.address,file.path(data.folder,zip.file), method="curl")
          }
          unzip(file.path(data.folder,zip.file))
     }
     powerdata<-file(file.path(data.folder,data.file),open="r")
     powerdf<-sqldf(sql.query,file.format=list(header=TRUE,sep=";"))
     close(powerdata)
     
     #Combine Date and Time text fields and convert then to a datetime data type
     powerdf<-unite(powerdf,readingtime,Date:Time,sep=" ")
     powerdf$readingtime<-strptime(powerdf$readingtime,"%e/%m/%Y %H:%M:%S")
}


