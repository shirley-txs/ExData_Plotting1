##read csv file
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = "?")

##convert dates to Date/Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

##using data from the dates 2007-02-01 and 2007-02-02 
plotdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

##plot histogram
png("plot1.png", width=480, height=480)
hist(plotdata$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()