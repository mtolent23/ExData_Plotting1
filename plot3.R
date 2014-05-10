# plot3.R - Graphic for Global Active Power by submeter
 
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
png("plot3.png", height=480, width=480)

# construct graphic
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
       col = c('black', 'red', 'blue'))

# close PNG file
dev.off()
