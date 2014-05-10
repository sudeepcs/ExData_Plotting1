# Exploratory Data Analysis
# -- Course Project 1
# -- Date: 05.10.2014

# Read the source data and convert the column names to lowercase
hpc <- read.table("./household_power_consumption.txt", 
                  header=TRUE, 
                  sep = ";", 
                  na.strings="?", 
                  colClasses = c("character", "character", rep("numeric", 7)))

names(hpc) <- tolower(names(hpc))

# Add a 'datetime' column using the strptime function
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time),
                         format="%d/%m/%Y %H:%M:%S")

# Subset to just the two dates of interest: Feb 1 & Feb 2, 2007
hpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

# Begin plotting - Open and save plot to PNG device
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2, 2))

# Plot 1
plot(x=hpc$datetime, y=hpc$global_active_power, 
     type='l', 
     xlab='', ylab='Global Active Power')

# Plot 2
plot(x=hpc$datetime, y=hpc$voltage, 
     type='l', 
     xlab="datetime", ylab="Voltage")

# Plot 3
with(hpc,
     plot(x=datetime, y=sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))

lines(x=hpc$datetime, y=hpc$sub_metering_2, col='Red')
lines(x=hpc$datetime, y=hpc$sub_metering_3, col='Blue')

legend(x="topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("Black", "Red", "Blue"),
       bty='n',
       xjust=1,
       y.intersp=0.8,
       cex=0.8,
       pt.cex=0.8,
       lwd=0.8)

# Plot 4
plot(x=hpc$datetime, y=hpc$global_reactive_power, 
     type='l',
     xlab='datetime', ylab='Global_reactive_power')

dev.off()