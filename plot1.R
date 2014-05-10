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
png(filename="plot1.png", width=480, height=480)

hist(hpc$global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     col = "Red"
)

dev.off()

