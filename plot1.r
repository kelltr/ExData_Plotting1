datafile <- "../data/household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #only for january
# subset again for only GLobal active power variable
globalActivePower <- as.numeric(subSetData$Global_active_power)
# plot in viewer
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# send plot to file
dev.copy(png,'plot1.png', units= "px", width=480, height=480)
dev.off() ## do not forget to turn off device