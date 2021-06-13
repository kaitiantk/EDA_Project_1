
data <- read.delim("household_power_consumption.txt", sep=";")
data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datetime<-paste(data$Date,data$Time)
datetime<-as.POSIXct(datetime)
png("plot3.png",width=480,height=480)
with(data,{plot(datetime,data$Sub_metering_1,ylab = "Energy sub metering",xlab="",col="black",type="l")
  lines(datetime,data$Sub_metering_2,ylab = "",xlab="",col="red")
  lines(datetime,data$Sub_metering_3,ylab="",xlab="",col="blue")})
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=2)
dev.off()