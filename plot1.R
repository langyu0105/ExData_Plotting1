# Read in Dataset
setwd("C:/Users/Yu/Desktop/New folder")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#Only use 2-days of data
power_sub <- subset(power, (Date=="2007-02-01" | Date=="2007-02-02"))

#PLotting
png('plot1.png', width=480, height=480)
hist(power_sub$Global_active_power/1000, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
