# plot2.R - Graphic for Global Active Power

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
png("plot2.png", height=480, width=480)

# construct graphic
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# close PNG file
dev.off()