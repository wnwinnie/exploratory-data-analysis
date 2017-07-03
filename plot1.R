#####plot 1
png("plot1.png",width=480, height=480)
hist(as.numeric(as.character(electricity_data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
