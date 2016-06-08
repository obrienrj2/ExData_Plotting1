## download data file into a data frame "household"
## Note that a precondition for this script to work is that the dataset
## "Electric Power consumption", given in the link of ExData_Plotting1, has
## been downloaded and stored in the working directory

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## select the subset of data for the two days in February 2007 that are of interest
feb_data <- subset(household, household$Date == "1/2/2007" | household$Date == "2/2/2007")

## combine the date and time columns into a single column
feb_data <- mutate(feb_data, DateTime = paste(feb_data$Date, feb_data$Time))

feb_data$Date <- as.Date(feb_data$Date, format = "%d/%m/%Y")  ## convert dates into date format
feb_data$DateTime <- as.POSIXct(feb_data$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Set margins and arrange for four graphs in a 2x2 format, filled by rows
par(mar = c(5,4,2,2), mfrow = c(2,2))

## Graph 1
plot(feb_data$Global_active_power ~ feb_data$DateTime, type = "l", 
     ylab = "Global Active Power", xlab = "")

## Graph 2
plot(feb_data$Voltage ~ feb_data$DateTime, type = "l", 
     ylab = "Voltage", xlab = "datetime")

## Graph 3
plot(feb_data$Sub_metering_1 ~ feb_data$DateTime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(feb_data$Sub_metering_2 ~ feb_data$DateTime, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "red")
lines(feb_data$Sub_metering_3 ~ feb_data$DateTime, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
     legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Graph 4
plot(feb_data$Global_reactive_power ~ feb_data$DateTime, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

## Copy resulting graph to file and close graphics device
dev.copy(png,file="plot4.png")
dev.off()

