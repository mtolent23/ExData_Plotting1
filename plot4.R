# plot4.R - Multi-graphics for global active power, voltage, submetering and global reactive power

# read data from file
data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=T, 
                   colClasses = c(rep('character', 2), rep('numeric', 7)),
                   na.strings='?')

# create column for plot
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# subset data on two days in February 2007
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & 
                     as.Date(DateTime) <= as.Date("2007-02-02"))

# open PNG file
png("plot4.png", height=480, width=480)

# configure 2x2 graphical display
par(mfrow=c(2,2))

# construct global active power graphic
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# construct voltage plot graphic
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

# construct submetering graphic
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col='black')
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# construct global reactive power graphic
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

# close PNG file
dev.off()
