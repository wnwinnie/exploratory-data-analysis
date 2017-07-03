getwd()
setwd("/home/ni/Coursera")
library(dplyr)
library(ggplot2)
list.files()
electricity <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
head(electricity)
dim(electricity)
#electricity$Date <- as.Date(electricity$Date)
electricity$Time <- strptime(electricity$Time)
head(electricity)
electricity %>% select(Date)
electricity_2 <- electricity
#electricity_2$Date <- as.Date(electricity_2$Date)
head(electricity_2)

electricity_data <- electricity_2 %>% dplyr::filter(Date=="2/2/2007"|Date=="1/2/2007")
dim(electricity_data)
head(electricity_data)


png("plot1.png",width=480, height=480)
hist(as.numeric(as.character(electricity_data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

#########plot2

electricity_data$datetime <- paste(electricity_data$Date,",",electricity_data$Time) 
#change the format of 
electricity_data$datetime_new <- strptime(electricity_data$datetime,format="%d/%m/%Y , %H:%M",tz = "")
head(electricity_data)

png("plot2.png",width=480, height=480)
plot(electricity_data$datetime_new,electricity_data$Global_active_power,type="l",xlab=NULL,ylab="Global Active Power (kilowatts)")
dev.off()




##### plot3 
head(electricity_data)

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

#####plot 4
png("plot4.png",width=480, height=480)
par(mar=c(5.1, 4,3, 2),mfrow=c(2,2))
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
       cex=0.3,
       text.font =8)

#plot bottomright
plot(electricity_data$datetime_new,electricity_data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
