##### plot3 
head(electricity_data)
#change the following from factor to numeric 
electricity_data$Sub_metering_1 <- electricity_data$Sub_metering_1 %>% as.character() %>% as.numeric()
electricity_data$Sub_metering_2 <- electricity_data$Sub_metering_2 %>% as.character() %>% as.numeric()
electricity_data$Sub_metering_3 <- electricity_data$Sub_metering_3 %>% as.character() %>% as.numeric()

png("plot3.png",width=480, height=480)
plot(electricity_data$datetime_new,electricity_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(electricity_data$datetime_new,electricity_data$Sub_metering_2,col="red")
lines(electricity_data$datetime_new,electricity_data$Sub_metering_3,col="blue")
legend(x="topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       cex=0.7,
       text.font =7)
dev.off()
