########################### Plot1.R

# Read the entire data file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Subset the data
subData <- subset(data, subset =(as.Date(Date, "%d/%m/%Y") >= "2007/02/01" & as.Date(Date, "%d/%m/%Y") <= "2007/02/02"))

#Plot as PNG
png("plot1.png", width=480, height=480)

#Plot histogram
hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close graph
dev.off()
