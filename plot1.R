

#data <- read.delim("household_power_consumption.txt", sep=";")
start.date <- "1/2/2007"
end.date <- "2/2/2007"
data1 <- subset(data,data$Date==start.date | data$Date==end.date, na.rm=TRUE)
hist(as.numeric(data1$Global_active_power),main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.copy(png,filename="plot1.png")
dev.off()
#-------------------------------------------------------------------------
#To get the data of specific dates(1/2/2007 and 2/2/2007)
data<-subset(fulldata,Date%in%c("1/2/2007","2/2/2007"))

#Creating png file
png("plot1.png",width=480,height=480)

#Creating Plot
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()