source("processdata.R") #import data and creates dataframe if it doesn't already exist.

png("plot2.png",width=480,height=480,units="px")

plot(powerdf$readingtime,powerdf$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()