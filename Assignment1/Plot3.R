# Plot3.png
# Reading data from text file and removing "?"
data<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting data for specific dates
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# Combining time and dates
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
# Creating png file
png("plot3.png", width=480, height=480)
# Ploting
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
# Closing Quartz
dev.off()
