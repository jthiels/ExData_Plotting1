require("sqldf")
png("Plot1.png")
file <- "household_power_consumption.txt"
sqlQuery <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
pwrData <- read.csv2.sql(file, sqlQuery)
h <- with(pwrData, hist(Global_active_power))
plot(h, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=range(0, 1200, 200), cex.lab=0.75, cex.axis=0.75
     )
dev.off()

