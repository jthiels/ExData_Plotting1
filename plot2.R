png("plot2.png")
require("sqldf")
file <- "household_power_consumption.txt"
sqlQuery <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
pwrData <- read.csv2.sql(file, sqlQuery)
pwrData$DaTi <-strptime(paste(pwrData$Date, pwrData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
pwrData$Date <- NULL
pwrData$Time <- NULL
with (pwrData, plot(DaTi, Global_active_power, type="n", cex.lab=.75, cex.axis=.75, xlab="", ylab="Global Active Power (kilowatts)", main=""))
with(pwrData, lines(DaTi, Global_active_power, lwd=1))
dev.off()

