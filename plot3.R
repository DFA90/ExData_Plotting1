header <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                     nrow=1, sep = ";", stringsAsFactors = FALSE)
data <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                   skip =66637, nrow = 2880, sep=";")
colnames(data) <- header[1,]

data$myTime <- (strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

png("Plot3.png")
with(data, plot(x=myTime, y = Sub_metering_1, type = "l",
                xlab = "", ylab = "Energy sub metering"))
with(data, lines(x=myTime, y = Sub_metering_2, type = "l", col = "red"))
with(data, lines(x=myTime, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.off()
