# Plot4.png
# Reading data from text file and removing "?"
data<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting data for specific dates
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# Combining time and dates
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
# Creating png file
png("plot4.png", width=480, height=480)
# Ploting
par(mfrow=c(2, 2))
plot(data$DateTime, data$Global_active_power,ylab="Global Active Power",type="l",xlab="")
plot(data$DateTime, data$Voltage, xlab="datetime",ylab="Voltage", type="l")
plot(data$DateTime, data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="l")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power,xlab="datetime", ylab="Global_reactive_Power", type="l")
# Closing Quartz
dev.off()
