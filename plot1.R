library(tidyverse)

data<- read.table("household_power_consumption.txt",
                  header=TRUE, 
                  sep=";",
                  na.strings = "?")

pd<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
pd$Date<- as.Date(pd$Date,"%d/%m/%y")
pd$Time<- strptime(pd$Time,"%X")

png("plot1.png")
hist(pd$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
