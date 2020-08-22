library(tidyverse)

data<- read.table("household_power_consumption.txt",
                  header=TRUE, 
                  sep=";",
                  na.strings = "?")

pd<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
pd<-pd%>%mutate(timestamp=paste(pd$Date,pd$Time))
pd$timestamp<-strptime(pd$timestamp,"%d/%m/%Y %X")

png("plot2.png")
plot(pd$timestamp,pd$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(pd$timestamp,pd$Global_active_power)
dev.off()
