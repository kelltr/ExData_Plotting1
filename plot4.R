datafile <- "../data/household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #only for january
# set the variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1) #kitchen
subMetering2 <- as.numeric(subSetData$Sub_metering_2) #laundry room
subMetering3 <- as.numeric(subSetData$Sub_metering_3) #large utility
# new subset global reactive
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
# new subset voltage
voltage <- as.numeric(subSetData$Voltage)
# set the plot window
png("plot4.png", width=480, height=480)
par(mfcol= c(2,2))
# row 1 column 1 plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# row 2 column 1 plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# row 1 column 2 plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# row 2 column 2 plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()  # do not forget to turn device off