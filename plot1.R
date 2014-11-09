# Read in the relavant subset of the provided household data
data <- read.delim('household_power_consumption_subset.txt', sep = ';')

# Set up png file
png("plot1.png", width = 480, height = 480, units = "px")

# Generate the histogram
with(data, hist(data$Global_active_power, col="red", main="Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))

# Close the device
dev.off()