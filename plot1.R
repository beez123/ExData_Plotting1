## File required for this assignment is available from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## Unzip to the file to the directory with the R script

## Read in the file, household_power_consumption.txt.
power_data <- read.csv2 ("household_power_consumption.txt")

## Take the subset of the rows relevant to Assignment #1
power_sample <- subset(power_data, Date=="1/2/2007"|Date=="2/2/2007")

## Remove the full data set releasing the memory
rm(power_data)


################### PLOT 1 ########################## (see notes on labels)

## Create the png file for output
png("Plot1.png", width = 480, height = 480)

## Pulling the Global Active Power as a numerical data type
global_ap <- as.numeric(paste(power_sample$Global_active_power))

## Create a histogram, color red, label and limits
hist(global_ap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim = c(0, 1200), xlim=c(0, 6), xaxt="n")

    ## Create a vector for the x axis labels
    lablist <- as.vector(c(0, 2, 4, 6))
    
    ## Set up the x-axis on the bottom and establish the sequence, but do not add the labels yet
    axis (1, at=lablist)
    
## Complete the png creation & resetting back to defaults
dev.off()
