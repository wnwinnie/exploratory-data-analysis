#########plot2

electricity_data$datetime <- paste(electricity_data$Date,",",electricity_data$Time) 
#change the format of datetime to be date time variable
electricity_data$datetime_new <- strptime(electricity_data$datetime,format="%d/%m/%Y , %H:%M",tz = "")
head(electricity_data)

png("plot2.png",width=480, height=480)
plot(electricity_data$datetime_new,electricity_data$Global_active_power,type="l",xlab=NULL,ylab="Global Active Power (kilowatts)")
dev.off()


