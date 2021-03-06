library(data.table)

## read file, catering for numeric columns containing '?' as missing values
FR = fread("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("Date", "Time", "character", "character", "character", "character", "character", "character", "character"))

## subset on the dates required 
required<-FR[FR$Date=="1/2/2007" | FR$Date=="2/2/2007",]

## create the output file
png(filename = "plot2.png")
plot(required$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()