library(tidyverse)

data<- read.table("household_power_consumption.txt",
                  header=TRUE, 
                  sep=";",
                  na.strings = "?")

pd<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
pd<-pd%>%mutate(timestamp=paste(pd$Date,pd$Time))
pd$timestamp<-strptime(pd$timestamp,"%d/%m/%Y %X")


#png("plot3.png")
plot(pd$timestamp,pd$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(pd$timestamp,pd$Sub_metering_1,col="black")
lines(pd$timestamp,pd$Sub_metering_2,col="red")
lines(pd$timestamp,pd$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
