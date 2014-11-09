# Read in the relavant subset of the provided household data
data <- read.delim('household_power_consumption_subset.txt', sep = ';')

# Prepare timestamps
dates <- data[,1]
times <- data[,2]
x <- paste(dates, times)
datetimes <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# Set up png file
png("plot3.png", width = 480, height = 480, units = "px")

# Start graph with sub meter 1
with(data, plot(x = datetimes, y = data$Sub_metering_1, 
                type="l", ylab = "Energy sub metering", xlab=""))

# Add other 2 lines
lines(x = datetimes, y = data$Sub_metering_2, col="red")
lines(x = datetimes, y = data$Sub_metering_3, col="blue")

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

# Close the device
dev.off()