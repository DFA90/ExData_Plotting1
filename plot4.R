header <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                     nrow=1, sep = ";", stringsAsFactors = FALSE)
data <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                   skip =66637, nrow = 2880, sep=";")
colnames(data) <- header[1,]

data$myTime <- (strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

png("Plot4.png")

par(mfrow = c(2,2))

#topleft
with(data, plot(x=myTime, y = Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))

#topright
with(data, plot(x=myTime, y = Voltage, type = "l",
                xlab = "datetime", ylab = "Voltage"))

#bottomleft
with(data, plot(x=myTime, y = Sub_metering_1, type = "l",
                xlab = "", ylab = "Energy sub metering"))
with(data, lines(x=myTime, y = Sub_metering_2, type = "l", col = "red"))
with(data, lines(x=myTime, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", col = c("black", "red", "blue"), lty = 1)

#bottomright
with(data, plot(x=myTime, y = Global_reactive_power, type = "l",
                xlab = "datetime"))

dev.off()
