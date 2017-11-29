#Read in Dataset
library(lubridate)
setwd("C:/Users/Yu/Desktop/New folder")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#Convert to datetime format
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

#Only use 2-days of data
power_sub <- subset(power, (Date=="2007-02-01" | Date=="2007-02-02"))

#Combine Date and Time
power_sub$DateTime <- ymd_hms(paste(power_sub$Date, power_sub$Time))


#Plotting
png('plot2.png', width=480, height=480)
plot(power_sub$DateTime, power_sub$Global_active_power/1000, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

