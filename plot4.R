## File required for this assignment is available from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## Unzip to the file to the directory with the R script

## Read in the file, household_power_consumption.txt.
power_data <- read.csv2 ("household_power_consumption.txt")

## Take the subset of the rows relevant to Assignment #1
power_sample <- subset(power_data, Date=="1/2/2007"|Date=="2/2/2007")

## Remove the full data set releasing the memory
rm(power_data)

################### PLOT 4 ##########################
## Create the png file for output
png("plot4.png", width = 480, height = 480)

  ## Creating a 2x2 grid for adding plots
  par (mfrow=c(2,2))
  
  ## Sizing the margins
  par (mar = c(4,4,2,2))

  ## dates for plotting the x-axis
  plot_dates <- strptime (paste (power_sample$Date, power_sample$Time), format="%d/%m/%Y %H:%M:%S")
  
  ## Pulling the Global Active Power, Voltage, Global_reactive_power, and submetering as a numerical data type
  sub_metering_1 <- as.numeric(paste(power_sample$Sub_metering_1))
  sub_metering_2 <- as.numeric(paste(power_sample$Sub_metering_2))
  sub_metering_3 <- as.numeric(paste(power_sample$Sub_metering_3))
  global_ap <- as.numeric(paste(power_sample$Global_active_power))
  voltage <- as.numeric(paste(power_sample$Voltage))
  global_rp <- as.numeric(paste(power_sample$Global_reactive_power))

##  >> Position 1 <<
  plot (plot_dates, global_ap, type="l", ylab = "Global Active Power", xlab="")


##  >> Position 2 <<
  ## Voltage Plot
  ## >> fix y-axis lables <<
  plot (plot_dates, voltage, type="l", ylab="Voltage", xlab = "datetime", lwd=0.5)


##  >> Position 3 <<
  ## creating the plot 'slate', setting the x-y labels
  plot (plot_dates, sub_metering_1, type="n", xlab="", ylab="Energy sub metering") 
  
      ## Adding lines to the plot
      lines (plot_dates, sub_metering_1, col="black") 
      lines (plot_dates, sub_metering_2, col="red") 
      lines (plot_dates, sub_metering_3, col="blue") 
      
      ## Placing legend on plot
      legend("topright", lty=1, lwd = 1, col = c("black", "red", "blue"), legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


##  >> Position 4 <<
  #Global_reactive_power Plot
  plot (plot_dates, global_rp, type="l", xlab="dateime", ylab = "Global_reactive_power")

## Complete the png creation & resetting back to defaults
dev.off()