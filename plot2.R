# Individual household electric power consumption Data Set URL from the UC Irvine Machine Learning Repository
datasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Download the file and put the file in the current folder
download.file(datasetUrl, destfile="./exdata-data-household_power_consumption.zip",method="curl")

# Unzip the file in the curent folder
unzip(zipfile="./exdata-data-household_power_consumption.zip", exdir="./")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Format date to Date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter data set from 2007-02-01 and 2007-02-02
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Append formatted Date + Time Column
data$dateTime <- as.POSIXct(paste(data$Date, data$Time))

# Plot 2
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save png file
dev.copy(png, "plot2.png", width=480, height=480)

# Close device
dev.off()