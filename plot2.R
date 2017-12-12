library(ggplot2)

data <- read.table("household_power_consumption.txt",sep = ";",header = T)
input_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

# Q2
data_time <- paste(input_data$Date,input_data$Time)
input_data$combined <- strptime(data_time, "%d/%m/%Y %H:%M:%S")

ggplot(input_data,aes(x=combined, y=as.numeric(as.character(Global_active_power)))) +
  geom_line() +
  ylab("Global Active Power(kilowatts)") +
  xlab("")  +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day"))

dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
