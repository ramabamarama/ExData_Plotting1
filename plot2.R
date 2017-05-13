#plot2.R produces a line chart of global active power over 2 days
rm(list = ls())
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

small_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

small_data$Date <- as.Date(small_data$Date, format = "%d/%m/%Y")

small_data$dateTime <- strptime(paste(small_data$Date, small_data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png",width = 480, height = 480)
plot(x= small_data$dateTime, y = as.numeric(as.character(small_data$Global_active_power)), 
     type = "l",
     lwd = 1,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()   

