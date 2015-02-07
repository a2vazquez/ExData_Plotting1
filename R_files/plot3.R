salida <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?",colClasses=c("character", "character",rep("numeric",7)))
salida$Date <- as.Date(salida$Date, "%d/%m/%Y")
salida1 <- salida[salida$Date == "2007-02-01"|salida$Date == "2007-02-02",]
salida1$Date <- paste(salida1$Date,salida1$Time)
salida1$Date <- as.POSIXlt(salida1$Date)
df1 <- data.frame(salida1$Date,salida1$Sub_metering_1,"Sub_metering_1")
names(df1)<- c("Date", "Value","Sub_metering")
df2 <- data.frame(salida1$Date,salida1$Sub_metering_2,"Sub_metering_2")
names(df2)<- c("Date", "Value","Sub_metering")
df3 <- data.frame(salida1$Date,salida1$Sub_metering_3,"Sub_metering_3")
names(df3)<- c("Date", "Value","Sub_metering")
salida2 <- rbind(df1,df2,df3)
png(filename = "plot3.png", width = 480, height = 480)

with(salida2, plot(Date,Value,type="n",xlab = NA, ylab = "Energy sub metering"))
with(subset(salida2,Sub_metering =="Sub_metering_1"),lines(Date,Value))
with(subset(salida2,Sub_metering =="Sub_metering_2"),lines(Date,Value,col="red"))
with(subset(salida2,Sub_metering =="Sub_metering_3"),lines(Date,Value,col="blue"))
legend("topright", col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,seg.len=2)

dev.off()
