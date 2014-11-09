# Read in the relavant subset of the provided household data
data <- read.delim('household_power_consumption_subset.txt', sep = ';')

# Prepare timestamps
dates <- data[,1]
times <- data[,2]
x <- paste(dates, times)
datetimes <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# Set up png file
png("plot2.png", width = 480, height = 480, units = "px")

# Generate the graph
with(data, plot(x = datetimes, y = data$Global_active_power, type="l", 
                ylab = "Global Active Power (kilowatts)", xlab=""))

# Close the device
dev.off()