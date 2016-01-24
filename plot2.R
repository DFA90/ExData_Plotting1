header <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                     nrow=1, sep = ";", stringsAsFactors = FALSE)
data <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                   skip =66637, nrow = 2880, sep=";")
colnames(data) <- header[1,]

data$myTime <- (strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))


with(data, plot(x=myTime, y = Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, "plot2.png")
dev.off()