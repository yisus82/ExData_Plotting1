# Read data from file
data <- read.table("../household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

# Subset data (we only want data from the dates 2007-02-01 and 2007-02-02)
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Create a new column joining Date and Time columns
data$dateTime <- paste(data$Date, data$Time, sep = " ")

# Format new column as Date/Time class
data$DateTime <- strptime(data$dateTime ,format = "%d/%m/%Y %H:%M:%S")

# Open PNg device
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

# Set margins and number of plots per row
par(mar = c(3, 4.5, 1, 1), mfrow = c(1, 1))

# Draw plot
plot(data$DateTime, data$Sub_metering_1, type = "l", lwd = 1.5, col = "black", main = NULL, xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", lwd = 1.5, col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", lwd = 1.5, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lwd = 2, lty = 1, pch = NA)

# Close device
dev.off()