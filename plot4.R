# Read in the relavant subset of the provided household data
data <- read.delim('household_power_consumption_subset.txt', sep = ';')

# Prepare timestamps
dates <- data[,1]
times <- data[,2]
x <- paste(dates, times)
datetimes <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# Set up png file
png("plot4.png", width = 480, height = 480, units = "px")

# Plotting functions for multiplot
# Global active power vs. days
plot1_1 <- function() {
  plot(x = datetimes, y = data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
}

# Voltage vs. days
plot1_2 <- function() {
  plot(x = datetimes, y = data$Voltage, type="l", ylab = "Voltage", xlab="datetime")
}

# Energy sub metering vs. days
plot2_1 <- function() {
  plot(x = datetimes, y = data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
  
  # Add other 2 lines
  lines(x = datetimes, y = data$Sub_metering_2, col="red")
  lines(x = datetimes, y = data$Sub_metering_3, col="blue")
  
  # Add legend
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1, col = c("black", "red", "blue"))
}

plot2_2 <- function() {
  plot(x = datetimes, y = data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
}

# Set multiplot parameters
par(mfrow = c(2,2))

# Graph all the above plots
with(data, {
  plot1_1() 
  plot1_2() 
  plot2_1() 
  plot2_2()
})

# Close the device
dev.off()