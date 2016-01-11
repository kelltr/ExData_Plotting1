datafile <- "../data/household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #only for january
# convert date time from character
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") # line graph type"l"
# send plot to file
dev.copy(png,'plot2.png', units= "px", width=480, height=480)
dev.off() ## do not forget to turn off device
