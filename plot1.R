# This script reproduces Plot 1 from the Exploratory Data Analysis Project 1

# Read the data. The table called household_power_consumption.txt must exist in your working directory. 
# We are only interested in the dates of 2007-02-01 and 2007-02-02 so I exclude everything else using skip= and nrows=. 
feb2days <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows = 2880)

# Because skip= also skips the first row, I read a small table with header=TRUE just to get the column names. 
col_headers <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows = 1)

# Now assign the correct column names to feb2days
colnames(feb2days) <- colnames(col_headers)

# Combine the Date and Time column and convert to a datetime format 
feb2days$datetime <- strptime(paste(feb2days$Date, feb2days$Time, sep=":"), "%d/%m/%Y:%H:%M:%S")

# Create Plot 1. Default width and height are 480 pixels. 
png(file="plot1.png")
hist(feb2days$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()