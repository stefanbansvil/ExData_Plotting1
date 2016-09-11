# Plot 3

## Setup data

### Create new data.frame with only the relevant variables

sub_met <- select(power, Sub_metering_1 : DateTime)

### Create a tidy version of the data.frame

tidy <- gather(sub_met, key = Sub_metering, value = energy_sub_metering, -DateTime)


## Create graph

### open PNG device; create empty png. file

png(filename = "plot3.png")

### Create the framework but do not populate the graph with data points yet

with(tidy, plot(DateTime, energy_sub_metering, type = "n", xlab = "", ylab = "Energy sub metering"))

### Fill the graph with data colored by Sub_metering variables

lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_1"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_1"], col = "black")
lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_2"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_2"], col = "red")
lines(tidy$DateTime[tidy$Sub_metering == "Sub_metering_3"], 
      tidy$energy_sub_metering[tidy$Sub_metering == "Sub_metering_3"], col = "blue")

### Add a legend

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

### Close png device

dev.off() 