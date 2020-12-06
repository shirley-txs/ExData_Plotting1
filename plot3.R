##read csv file
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = "?")

##convert dates to Date/Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

##using data from the dates 2007-02-01 and 2007-02-02 
plotdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

##create new column on Date-time
datetime <- paste(plotdata$Date, plotdata$Time)
plotdata$DateTime <- as.POSIXct(datetime)

##plot chart 
png("plot3.png", width=480, height=480)
with(plotdata, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))
with(plotdata, lines(DateTime, Sub_metering_2, type="l", col = "red"))
with(plotdata, lines(DateTime, Sub_metering_3, type="l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1)
dev.off()