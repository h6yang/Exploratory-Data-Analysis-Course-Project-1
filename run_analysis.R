library(ggplot2)
library(gridExtra)

setwd("/Users/hyang/Documents/DBMI/Personal/R_project")
list.files()
#rm(list=ls())

data <- read.table("household_power_consumption.txt",sep = ";",header = T)
head(data)
# subset data from the dates 2007-02-01 and 2007-02-02
summary(data$Date)
dim(data)
input_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
dim(input_data)
colnames(input_data)

#Q1
summary(as.numeric(as.character(input_data$Global_active_power)))
hist(as.numeric(as.character(input_data$Global_active_power)),col="red",
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# save file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()


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

# Q4
p1 <- ggplot(input_data,aes(x=combined, y=as.numeric(as.character(Global_active_power)))) +
  geom_line() +
  ylab("Global Active Power(kilowatts)") +
  xlab("")  +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day"))

p2 <- ggplot(input_data,aes(x=combined, y=as.numeric(as.character(Voltage)))) +
  geom_line() +
  ylab("Voltage") +
  xlab("datatime") +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day"))

p3 <- ggplot(input_data,aes(x=combined)) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_1)),color = "Sub_metering_1")) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_2)),color = "Sub_metering_2")) +
  geom_line(aes(y = as.numeric(as.character(Sub_metering_3)),color = "Sub_metering_3")) +
  ylab("Energy sub metering") +
  theme(legend.position=c(.9,.93)) +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day")) +
  xlab("")

p4 <- ggplot(input_data,aes(x=combined, y=as.numeric(as.character(Global_reactive_power)))) +
  geom_line() +
  ylab("Global reactive power") +
  xlab("datatime") +
  theme(axis.text.y=element_text(angle=90,hjust=1)) + 
  scale_x_datetime( date_labels = "%a", breaks = date_breaks("1 day"))

grid.arrange(p1,p2,p3,p4, ncol=2)
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()


