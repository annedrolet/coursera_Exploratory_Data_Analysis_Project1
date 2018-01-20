
#read data
data <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#format Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# hpc (household power consumption) = subset of data with only data with dates 2007-02-01 and 2007-02-02
hpc <- subset(data,  grepl("2007-02-0[1-2]",Date))

# Add variable datetime with good format
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")

# create plots
par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc, {
  plot(datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
  plot(datetime,Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(datetime,Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  lines(datetime,Sub_metering_2,col='Red')
  lines(datetime,Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})



# put in png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

# close png file
dev.off()