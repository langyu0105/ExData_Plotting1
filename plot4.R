#Read in Dataset
library(lubridate)
setwd("C:/Users/Yu/Desktop/New folder")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                    stringsAsFactors=FALSE)

#Convert to datetime format
power$Date <- dmy(power$Date)

#Only use 2-days of data
power_sub <- subset(power, (Date=="2007-02-01" | Date=="2007-02-02"))

#Combine Date and Time
power_sub$DateTime <- ymd_hms(paste(power_sub$Date, power_sub$Time))

#Convert to numeric
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)
power_sub$Global_reactive_power <- as.numeric(power_sub$Global_reactive_power)
power_sub$Voltage <- as.numeric(power_sub$Voltage)

#Plotting
png('plot4.png', width=480, height=480)
# set up figure frame
par(mfrow=c(2,2))
#Sub-Figure 1
plot(power_sub$DateTime, power_sub$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#Sub-Figure 2
plot(power_sub$DateTime, power_sub$Voltage, type="l",
     ylab = "Voltage", xlab = "datetime")
#Sub-Figure 3
plot(power_sub$DateTime, power_sub$Sub_metering_1, type="l", col="black",
     ylab = "Energy sub metering", xlab = "")
lines(power_sub$DateTime, power_sub$Sub_metering_2, col="red")
lines(power_sub$DateTime, power_sub$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
#Sub-Figure 4
plot(power_sub$DateTime, power_sub$Global_reactive_power, type="l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

