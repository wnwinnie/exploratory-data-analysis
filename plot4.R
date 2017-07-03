#####plot 4
png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))

#plot topleft
plot(electricity_data$datetime_new,electricity_data$Global_active_power,
     type="l",
     xlab=NULL,
     ylab="Global Active Power (kilowatts)")
#plot topright
plot(electricity_data$datetime_new,electricity_data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot bottomleft
plot(electricity_data$datetime_new,electricity_data$Sub_metering_1,type="l",
    ylab="Energy sub metering",xlab="")
lines(electricity_data$datetime_new,electricity_data$Sub_metering_2,col="red")
lines(electricity_data$datetime_new,electricity_data$Sub_metering_3,col="blue")
legend(x="topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty = "n")


#plot bottomright
plot(electricity_data$datetime_new,electricity_data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
