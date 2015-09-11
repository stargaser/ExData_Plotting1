
# Read in the data.
# Here we don't try to use the Date class.
elec <- read.csv("../household_power_consumption.txt", na.strings="?",
                 sep=";", header=TRUE, 
                 colClasses=c("character","character", "numeric",
                              "numeric","numeric","numeric","numeric",
                              "numeric","numeric"))

# Keeping the date as a string allows us to select the days of interest.
subdf <- elec[grep("^[12]/2/2007", elec$Date),]

# Now we want to convert the first two columns of subdf
# to a date and time
library(lubridate)

subdf$DateTime <- dmy_hms(paste(subdf$Date,subdf$Time))
subdf <- transform(subdf, Weekday = factor(wday(subdf$DateTime, label=TRUE)))

# open a PNG device. By default png makes a 480x480 pixel image
#  so we don't need to specify height and width explicitly.
png(filename="plot3.png")

plot(subdf$DateTime, subdf$Sub_metering_1, type="l",
     xlab=NA, ylab="Energy sub metering")
lines(subdf$DateTime, subdf$Sub_metering_2, col="red")
lines(subdf$DateTime, subdf$Sub_metering_3, col="blue")
legend("topright", lty="solid", col = c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
