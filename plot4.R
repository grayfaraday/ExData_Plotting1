########################## Plot4.R

# Read the entire data file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Subset the data
subData <- subset(data, subset =(as.Date(Date, "%d/%m/%Y") >= "2007/02/01" & as.Date(Date, "%d/%m/%Y") <= "2007/02/02"))

#Plot as PNG
png("plot4.png", width=480, height=480)

#Set a 2x2 pane
par(mfrow = c(2, 2)) 

#Format date/time
timeSeries <- strptime(paste(subData$Date, subData$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

#Graphs
plot(timeSeries, subData$Global_active_power, xlab = "", ylab = "Global Active Power", type="l")
plot(timeSeries, subData$Voltage, xlab="datetime", ylab = "Voltage", type = "l")

plot(timeSeries, subData$Sub_metering_1, xlab = "", ylab ="Energy sub metering", col = "black", type = "l")
lines(timeSeries, subData$Sub_metering_2, col = "red", type ="l")
lines(timeSeries, subData$Sub_metering_3, col = "blue", type ="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col= c("black", "red", "blue"))

plot(timeSeries, subData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")

#Close graph
dev.off()
