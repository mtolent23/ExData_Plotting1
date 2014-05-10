# plot1.R - Histogram of Global Active Power

# read data from file
data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=T, 
                   colClasses = c(rep('character', 2), rep('numeric', 7)),
                   na.strings='?')

# convert Date column to date type
data$Date<-as.Date(as.character(data$Date), "%d/%m/%Y")

# subset data on two days in February 2007
data <- subset(data, as.Date(Date) >= as.Date("2007-02-01") & as.Date(Date) <= as.Date("2007-02-02"))

# open PNG file
png("plot1.png", height=480, width=480)

# construct the histogram
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# close PNG file
dev.off()
