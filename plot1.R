header <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                     nrow=1, sep = ";", stringsAsFactors = FALSE)
data <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt",
                   skip =66637, nrow = 2880, sep=";")
colnames(data) <- header[1,]


hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()