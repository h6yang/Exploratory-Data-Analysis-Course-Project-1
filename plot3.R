library(ggplot2)

data <- read.table("household_power_consumption.txt",sep = ";",header = T)
input_data <- subset(data, data$Date %in% c("2/1/2007","2/2/2007"))

# Q3
ggplot(input_data,aes(x=combined)) +
  geom_line(aes(y = as.numeric(Sub_metering_1),color = "Sub_metering_1")) +
  geom_line(aes(y = as.numeric(Sub_metering_2),color = "Sub_metering_2")) +
  geom_line(aes(y = as.numeric(Sub_metering_3),color = "Sub_metering_3")) +
  ylab("Energy sub metering") + ylim(c(0,20)) +
  theme(legend.position=c(.68,.98), legend.direction="horizontal") +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day")) +
  xlab("")

dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
