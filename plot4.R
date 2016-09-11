# Plot 4

### open PNG device; create empty png. file

png(filename = "plot4.png") 

### Prepare graphical output for 4 graphs

par(mfrow = c(2,2))

### Create graphs 1

with(power, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab =  "Global Active Power (kilowatts)"))

### Create graphs 2

with(power, plot(DateTime, Voltage, type = "l"))

### Create graphs 3

with(tidy, plot(DateTime, energy_sub_metering, type = "n", xlab = "", ylab = "Energy sub metering"))

lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_1"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_1"], col = "black")
lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_2"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_2"], col = "red")
lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_3"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_3"], col = "blue")


legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

### Create graphs 4

with(power, plot(DateTime, Global_reactive_power, type = "l"))

### Close png device

dev.off() 
