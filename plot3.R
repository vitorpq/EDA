pwcon <- read.csv("household_power_consumption.txt", sep=";", na.strings='?', colClasses=c('factor', 'character', 'numeric', 'numeric','numeric','numeric','numeric','numeric','numeric'))
pwcon <- transform(pwcon, Date = as.Date(Date, format="%d/%m/%Y"))
subcon <- subset(pwcon, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(subcon$Date, subcon$Time)
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")
png("plot3.png",  width = 480, height = 480, units = "px")
with(subcon, {
  plot(datetime, Sub_metering_1, type='l', xlab = '', ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")}
)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
