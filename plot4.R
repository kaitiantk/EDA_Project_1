
data <- read.delim("household_power_consumption.txt", sep=";")
data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datetime<-paste(data$Date,data$Time)
datetime<-as.POSIXct(datetime)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# 1st
with(data,plot(datetime,Global_active_power,ylab = "Global Active Power",xlab="",col="black",type="l"))
# 2nd
with(data,plot(datetime,Voltage,ylab = "Voltage",xlab="datetime",col="black",type="l"))
# 3rd
with(data,{plot(datetime,data$Sub_metering_1,ylab = "Energy sub metering",xlab="",col="black",type="l")
  lines(datetime,data$Sub_metering_2,ylab = "",xlab="",col="red")
  lines(datetime,data$Sub_metering_3,ylab="",xlab="",col="blue")})
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=2)
# 4th
with(data,plot(datetime,Global_reactive_power,ylab = "Global_reactive_power",xlab="datetime",col="black",type="l"))
dev.off()