#plot3.R produces a coloured line chart of sub_metering over 2 days
rm(list = ls())
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

small_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

small_data$Date <- as.Date(small_data$Date, format = "%d/%m/%Y")

small_data$dateTime <- strptime(paste(small_data$Date, small_data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png",width = 480, height = 480)
plot(x= small_data$dateTime, y = as.numeric(as.character(small_data$Sub_metering_1)), 
     type = "l",
     lwd = 1,
     ylab = "Energy sub metering",
     xlab = "")
lines(x= small_data$dateTime, y = as.numeric(as.character(small_data$Sub_metering_2)),
      col = "Red")
lines(x= small_data$dateTime, y = as.numeric(as.character(small_data$Sub_metering_3)),
      col = "Blue")
legend("topright", 
       lty = 1, 
       col = c("black","red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()   

