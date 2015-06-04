png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
plot(powerdf$readingtime,powerdf$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power")

plot(powerdf$readingtime,powerdf$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(powerdf$readingtime,powerdf$Sub_metering_1, xlab="",ylab="Energy sub metering", type="n")
lines(powerdf$readingtime,powerdf$Sub_metering_1)
lines(powerdf$readingtime,powerdf$Sub_metering_2, col="red")
lines(powerdf$readingtime,powerdf$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"),lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")

plot(powerdf$readingtime,powerdf$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")
dev.off()