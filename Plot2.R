# Plot2.png
# Reading data from text file and removing "?"
data<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting data for specific dates
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# Combining time and dates
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
# Creating png file
png("plot2.png", width=480, height=480)
# Ploting
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Closing Quartz
dev.off()