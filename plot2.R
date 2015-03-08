## File required for this assignment is available from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## Unzip to the file to the directory with the R script

## Read in the file, household_power_consumption.txt.
power_data <- read.csv2 ("household_power_consumption.txt")

## Take the subset of the rows relevant to Assignment #1
power_sample <- subset(power_data, Date=="1/2/2007"|Date=="2/2/2007")

## Remove the full data set releasing the memory
rm(power_data)

################### PLOT 2 ########################## 
## Create the png file for output
png("plot2.png", width = 480, height = 480)

    ## dates for plotting the x-axis
    plot_dates <- strptime (paste (power_sample$Date, power_sample$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Pulling the Global Active Power as a numerical data type
    global_ap <- as.numeric(paste(power_sample$Global_active_power))
    
    ## plotting line graph
    plot (plot_dates, global_ap,type="l", ylab="Global Active Power (kilowatts)",xlab="")
    

## Complete the png creation & resetting back to defaults
dev.off()

