png("plot3.png")
require("sqldf")
file <- "household_power_consumption.txt"
sqlQuery <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
pwrData <- read.csv2.sql(file, sqlQuery)
pwrData$DaTi <-strptime(paste(pwrData$Date, pwrData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
pwrData$Date <- NULL
pwrData$Time <- NULL
with(pwrData, plot(DaTi, Sub_metering_1, type="n", main="",cex.axis=.75, cex.lab=.75, xlab="", ylab="Energy sub metering", yaxp= c(0, 30, 3)))
with(pwrData, lines(DaTi, Sub_metering_1))
with(pwrData, lines(DaTi, Sub_metering_2, col="red"))
with(pwrData, lines(DaTi, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col= c("black", "red", "blue"), cex=0.90, pt.cex=0.90, bty="o", y.intersp=0.90, xjust=0)
dev.off()
