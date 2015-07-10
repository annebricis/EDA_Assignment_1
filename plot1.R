library(data.table)

## read file, catering for numeric columns containing '?' as missing values
FR = fread("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("Date", "Time", "character", "character", "character", "character", "character", "character", "character"))

## subset on the dates required 
required<-FR[FR$Date=="1/2/2007" | FR$Date=="2/2/2007",]

## reset the margins
par(mar=c(4,4,1,2))

## create the output file
png(filename = "plot1.png")
hist(as.numeric(required$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()