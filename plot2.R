########################### Plot2.R

# Read the entire data file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Subset the data
subData <- subset(data, subset =(as.Date(Date, "%d/%m/%Y") >= "2007/02/01" & as.Date(Date, "%d/%m/%Y") <= "2007/02/02"))

#Plot as PNG
png("plot2.png", width=480, height=480)

#Format date/time
timeSeries <- strptime(paste(subData$Date, subData$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

#Plot line graph
plot(timeSeries, subData$Global_active_power, xlab = "", ylab= "Global active power (kilowatts)", type = "l")

#Close graph
dev.off()
