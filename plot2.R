## plot2.R
#
#  Creates plot2.png

## Assumptions
#
#  Please set the working directory equal to the directory that contains processdata.R
#  before running this script

source("processdata.R") #import data and creates dataframe if it doesn't already exist.

png("plot2.png",width=480,height=480,units="px")

plot(powerdf$readingtime,powerdf$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()