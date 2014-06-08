
#Read in Household Power Consumption Data
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header=TRUE, na.strings="?")

#Subset Data
#We will only be using data from the dates 2007-02-01 and 2007-02-02

#Change to Date format
data[,1] <- as.Date(strptime(data[,1],format="%d/%m/%Y"))
data2 <- subset(data, (Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01")))

data2$DateTime = strptime(paste(data2$Date, data2$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")


###  Create Plot  ###
par(mar = c(2, 4, 1, 1))
plot(data2$DateTime, data2$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
points(data2$DateTime, data2$Sub_metering_2, type="l", col="red")
points(data2$DateTime, data2$Sub_metering_3, type="l", col="blue")
legend("topright", pch="_", col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



###  Save Plot to PNG File  ###
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()                          ## Don't forget to close the PNG device!
