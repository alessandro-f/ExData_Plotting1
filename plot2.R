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

#plot2
plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"ExData_Plotting1/plot2.png", width=480, height=480)
dev.off()




