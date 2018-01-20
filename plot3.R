
#read data
data <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#format Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# hpc (household power consumption) = subset of data with only data with dates 2007-02-01 and 2007-02-02
hpc <- subset(data,  grepl("2007-02-0[1-2]",Date))

# Add variable datetime with good format
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")

# create plot
plot(hpc$datetime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, col = "Red")
lines(hpc$datetime, hpc$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, lwd = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)

# put in png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)

# close png file
dev.off()