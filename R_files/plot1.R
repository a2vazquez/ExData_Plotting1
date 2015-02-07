salida <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?",colClasses=c("character", "character",rep("numeric",7)))
salida$Date <- as.Date(salida$Date, "%d/%m/%Y")
salida1 <- salida[salida$Date == "2007-02-01"|salida$Date == "2007-02-02",]
salida1$Date <- paste(salida1$Date,salida1$Time)
salida1$Date <- as.POSIXlt(salida1$Date)
png(filename = "plot1.png", width = 480, height = 480)
hist(salida1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()