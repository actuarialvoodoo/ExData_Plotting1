## plot3.R
#
#  Creates plot3.png

## Assumptions
#
#  Please set the working directory equal to the directory that contains processdata.R
#  before running this script

source("processdata.R") #import data and creates dataframe if it doesn't already exist.

png("plot3.png",width=480,height=480,units="px")

plot(powerdf$readingtime,powerdf$Sub_metering_1, xlab="",ylab="Energy sub metering", type="n")
lines(powerdf$readingtime,powerdf$Sub_metering_1)
lines(powerdf$readingtime,powerdf$Sub_metering_2, col="red")
lines(powerdf$readingtime,powerdf$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"),lwd=1,
     legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()