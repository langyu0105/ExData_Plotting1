#Read in Dataset
library(lubridate)
setwd("C:/Users/Yu/Desktop/New folder")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert to datetime format
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

#Only use 2-days of data
power_sub <- subset(power, (Date=="2007-02-01" | Date=="2007-02-02"))

#Combine Date and Time
power_sub$DateTime <- ymd_hms(paste(power_sub$Date, power_sub$Time))

#Plotting
png('plot3.png', width=480, height=480)
plot(power_sub$DateTime, power_sub$Sub_metering_1, type="l", col="black",
     ylab = "Energy sub metering", xlab = "")
lines(power_sub$DateTime, power_sub$Sub_metering_2, col="red")
lines(power_sub$DateTime, power_sub$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()

