# Plot 2

### open PNG device; create empty png. file 

png(filename = "plot2.png") ### open PNG device; create empty png. file 

### Create graph

with(power, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab =  "Global Active Power (kilowatts)"))

## Close png device

dev.off() 