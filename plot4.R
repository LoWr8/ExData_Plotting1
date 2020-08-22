library(tidyverse)

data<- read.table("household_power_consumption.txt",
                  header=TRUE, 
                  sep=";",
                  na.strings = "?")

pd<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
pd<-pd%>%mutate(timestamp=paste(pd$Date,pd$Time))
pd$timestamp<-strptime(pd$timestamp,"%d/%m/%Y %X")

  

png("plot4.png")
par(mfcol=c(2,2))
with(pd,{
  plot(timestamp,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
  lines(timestamp,Global_active_power)
  plot(timestamp,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(timestamp,Sub_metering_1,col="black")
  lines(timestamp,Sub_metering_2,col="red")
  lines(timestamp,Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  plot(timestamp,Voltage,type="n",xlab="datetime",ylab="Voltage")
  lines(timestamp,Voltage)
  plot(timestamp,Global_reactive_power,type="n",xlab="datetime")
  lines(timestamp,Global_reactive_power)
})
dev.off()
