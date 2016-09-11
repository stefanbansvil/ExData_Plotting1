# Plot 1

## setup (also needed for plot2.R, plot3.R and plot4.R)

### Assigning needed libraries

library(dplyr) 
library(lubridate)
library(tidyr)


## Reading data

### Importing file to R

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

### Filter data 

power <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")

### Transform variables into the correct class (Date, Time & numeric)

power <- mutate(power, DateTime= dmy_hms(paste(power$Date,power$Time, sep = '_')),  Date = dmy(Date), 
                Time = hms(Time), Global_active_power= as.numeric(Global_active_power),
                Sub_metering_1 = as.numeric(Sub_metering_1), 
                Sub_metering_2 = as.numeric(Sub_metering_2),
                Sub_metering_3 = as.numeric(Sub_metering_3))



## Create plot 1

### New working directory (github folder)

setwd("ExData_Plotting1")

### Open PNG device; create empty png. file 

png(filename = "plot1.png") 

### Create graph

with(power, hist(Global_active_power, main = "Global Active Power", 
                    col= "red", xlab = "Global Active Power (kilowatts)", 
                    ylab= "Frequency"))

### Close png device

dev.off() 






