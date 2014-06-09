
#Read in Household Power Consumption Data
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header=TRUE, na.strings="?")

#Subset Data
#We will only be using data from the dates 2007-02-01 and 2007-02-02

#Change to Date format
data[,1] <- as.Date(strptime(data[,1],format="%d/%m/%Y"))
data2 <- subset(data, (Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01")))

data2$DateTime = strptime(paste(data2$Date, data2$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")


###  Create Plot  ###
#Set write path
png(file = "plot2.png", bg = "transparent")
plot(data2$DateTime, data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Close writing
dev.off()