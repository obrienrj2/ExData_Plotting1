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

## Set margins
par(mar = c(5,4,2,2))

## Create the histogram and copy it to file.
hist(feb_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()

