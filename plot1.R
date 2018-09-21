library(downloader)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="data_ass_1.zip", mode="wb") 
unzip ("data_ass_1.zip", exdir="eccoidati")
household <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

household$Date <- as.Date(household$Date, "%d/%m/%Y")
t <- filter(household, Date >= " 2007-02-01" & Date <= " 2007-02-02")
t <- t[complete.cases(t),]
#plot1
hist(new$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png,"ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()




