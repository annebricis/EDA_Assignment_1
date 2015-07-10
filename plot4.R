library(data.table)

## read file, catering for numeric columns containing '?' as missing values
FR = fread("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("Date", "Time", "character", "character", "character", "character", "character", "character", "character"))

## subset on the dates required 
required<-FR[FR$Date=="1/2/2007" | FR$Date=="2/2/2007",]

## create the output file
png(filename = "plot4.png")
par(mfcol=c(2,2))

plot(required$Global_active_power, type="l", xlab="", ylab="Global Active Power")

with(required, plot(Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(required, points(Sub_metering_1, type = "l"))
with(required, points(Sub_metering_2, type = "l", col="red"))
with(required, points(Sub_metering_3, type = "l", col="blue"))
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

with(required, plot(Voltage, type="l"))

with(required, plot(Global_reactive_power, type="l"))

dev.off()