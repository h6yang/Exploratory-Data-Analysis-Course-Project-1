data <- read.table("household_power_consumption.txt",sep = ";",header = T)
# subset data from the dates 2007-02-01 and 2007-02-0
input_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

#Q1
summary(as.numeric(as.character(input_data$Global_active_power)))
hist(as.numeric(as.character(input_data$Global_active_power)),col="red",
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# save file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
