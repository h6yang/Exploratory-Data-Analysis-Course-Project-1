library(ggplot2)

data <- read.table("household_power_consumption.txt",sep = ";",header = T)
input_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
data_time <- paste(input_data$Date,input_data$Time)
input_data$combined <- strptime(data_time, "%d/%m/%Y %H:%M:%S")

# Q3
ggplot(input_data,aes(x=combined)) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_1)),color = "Sub_metering_1")) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_2)),color = "Sub_metering_2")) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_3)),color = "Sub_metering_3")) +
  ylab("Energy sub metering") +
  theme(legend.position=c(.9,.93)) +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day")) +
  xlab("")

dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
