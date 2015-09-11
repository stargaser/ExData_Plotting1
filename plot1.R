
# Read in the data.
# Here we don't try to use the Date class.
elec <- read.csv("../household_power_consumption.txt", na.strings="?",
                  sep=";", header=TRUE, 
                  colClasses=c("character","character", "numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric","numeric"))

# Keeping the date as a string allows us to select the days of interest.
subdf <- elec[grep("^[12]/2/2007", elec$Date),]

# open a PNG device. By default png makes a 480x280 pixel image
#  so we don't need to specify height and width explicitly.
png(filename="plot1.png")

# Make the histogram in bins of 0.5.
hist(subdf$Global_active_power, breaks=seq(0,7.5,0.5), 
     col="red", main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)")

dev.off()
