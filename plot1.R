source("processdata.R") #import data and creates dataframe if it doesn't already exist.

png("plot1.png",width=480,height=480,units="px")

hist(powerdf$Global_active_power,breaks=0:15*0.5,col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()