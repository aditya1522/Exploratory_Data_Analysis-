# Plot1.png

# Reading data from text file and removing "?"
data<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting data for specific dates
data1<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
# Creating png file
png(filename="plot1.png",width=480,height=480)
# plotting histogram and formating it
hist(data1$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
# turning quartz screen off - I am a mac user
dev.off()