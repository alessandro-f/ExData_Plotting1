library(downloader)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="data_ass_1.zip", mode="wb") 
unzip ("data_ass_1.zip", exdir="eccoidati")
household <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

household$Date <- as.Date(household$Date, "%d/%m/%Y")

t <- filter(household, Date >= " 2007-02-01" & Date <= " 2007-02-02")
t <- t[complete.cases(t),]
dateTime <- paste(t$Date, t$Time)
dateTime <- setNames(dateTime, "DateTime")
t <- t[ ,!(names(t) %in% c("Date","Time"))]
t <- cbind(dateTime, t)
t$dateTime <- as.POSIXct(dateTime)

#plot 3

with(t, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)

dev.copy(png, file="ExData_Plotting1/plot3.png", height=480, width=480)
dev.off()
