# Read data from file
data <- read.table("../household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

# Subset data (we only want data from the dates 2007-02-01 and 2007-02-02)
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Create a new column joining Date and Time columns
data$dateTime <- paste(data$Date, data$Time, sep = " ")

# Format new column as Date/Time class
data$DateTime <- strptime(data$dateTime ,format = "%d/%m/%Y %H:%M:%S")

# Open PNg device
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

# Set margins and number of plots per row
par(mar = c(4.5, 4.5, 2, 1), mfrow = c(1, 1))

# Draw plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Close device
dev.off()