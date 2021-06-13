

data <- read.delim("household_power_consumption.txt", sep=";")
#week.day <- weekdays(as.Date(data$Date))
#data1 <- as.data.frame(cbind(data,week.day))

# na.omit does not remove the n/a entries. Don't know why.
#data1 <- as.data.frame(na.omit(data1$Global_active_power))

#data1 <- subset(data1,week.day==c("Thursday","Friday","Saturday"))
#data1$Global_active_power <- as.numeric(data1$Global_active_power)

#xyplot(Global_active_power~week.day,data1.agg,ylab="Global Active Power (kilowwatts)")

#dev.copy(png,filename="plot2.png")
#dev.off()

#-------------------------------------------------------
data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))

#Making a POSIXct date 
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datetime<-paste(data$Date,data$Time)
datetime<-as.POSIXct(datetime)

#Creating png
#png("plot2.png",width=480,height=480)

#Creating plot
with(data,plot(datetime,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="",type="l"))
dev.off()