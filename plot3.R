## File required for this assignment is available from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## Unzip to the file to the directory with the R script

## Read in the file, household_power_consumption.txt.
power_data <- read.csv2 ("household_power_consumption.txt")

## Take the subset of the rows relevant to Assignment #1
power_sample <- subset(power_data, Date=="1/2/2007"|Date=="2/2/2007")

## Remove the full data set releasing the memory
rm(power_data)

################### PLOT 3 ########################## (need the x-axis for days)


## Create the png file for output
png("plot3.png", width = 480, height = 480)

## dates for plotting the x-axis
plot_dates <- strptime (paste (power_sample$Date, power_sample$Time), format="%d/%m/%Y %H:%M:%S")

## Submetering as numeric values
sub_metering_1 <- as.numeric(paste(power_sample$Sub_metering_1))
sub_metering_2 <- as.numeric(paste(power_sample$Sub_metering_2))
sub_metering_3 <- as.numeric(paste(power_sample$Sub_metering_3))

## creating the plot 'slate', setting the x-y labels
plot (plot_dates, sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

    ## Adding lines to the plot
    lines (plot_dates, sub_metering_1, col="black")
    lines (plot_dates, sub_metering_2, col="red")
    lines (plot_dates, sub_metering_3, col="blue")
    
    ## Placing legend on plot
    legend("topright", lty=1, lwd = 2, col = c("black", "red", "blue"), legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Complete the png creation & resetting back to defaults
dev.off()