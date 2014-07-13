png("plot4.png")
require("sqldf")
file <- "/home/john/data/household_power_consumption.txt"
sqlQuery <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
pwrData <- read.csv2.sql(file, sqlQuery)
pwrData$DaTi <-strptime(paste(pwrData$Date, pwrData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
pwrData$Date <- NULL
pwrData$Time <- NULL
par(mfcol=c(2,2), mar=c(4, 4, 1, 2))
with (pwrData, plot(DaTi, Global_active_power, type="n", cex.lab=.75, cex.axis=.75, xlab="", ylab="Global Active Power", main=""))
with(pwrData, lines(DaTi, Global_active_power, lwd=1))
with(pwrData, plot(DaTi, Sub_metering_1, type="n", main="",cex.axis=.75, cex.lab=.75, xlab="", ylab="Energy sub metering", yaxp= c(0, 30, 3)))
with(pwrData, lines(DaTi, Sub_metering_1))
with(pwrData, lines(DaTi, Sub_metering_2, col="red"))
with(pwrData, lines(DaTi, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col= c("black", "red", "blue"), cex=0.80, pt.cex=0.80, bty="n", y.intersp=0.80, xjust=0)
with(pwrData, plot(DaTi, Voltage, cex.axis=0.75, cex.lab=0.75, xlab="datetime", type="n"))
with(pwrData, lines(DaTi, Voltage))
with(pwrData, plot(DaTi, Global_reactive_power, type="n", cex.axis=0.75, cex.lab=0.75, xlab="datetime"))
with(pwrData, lines(DaTi, Global_reactive_power))
dev.off()
