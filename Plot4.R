data = read.table('C:/Users/Mariela/Desktop/Jade tareas/Curso Cienciade Datos/R/datasciencecoursera/household_power_consumption.txt',
                  skip=1,sep=";")
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
               "Sub_metering_3")

subset_data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

subset_data$Date<-as.Date(subset_data$Date,format="%d/%m/%Y")
subset_data$Time<-strptime(subset_data$Time,format="%H:%M:%S")

subset_data[1:1440,"Time"]<-format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"]<-format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

subset_data$Global_active_power<-as.numeric(as.character(subset_data$Global_active_power))
subset_data$Voltage<-as.numeric(as.character(subset_data$Voltage))
subset_data$Sub_metering_1<-as.numeric(as.character(subset_data$Sub_metering_1))
subset_data$Sub_metering_2<-as.numeric(as.character(subset_data$Sub_metering_2))
subset_data$Sub_metering_3<-as.numeric(as.character(subset_data$Sub_metering_3))
subset_data$Global_reactive_power<-as.numeric(as.character(subset_data$Global_reactive_power))

png("Plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))
with(subset_data,{ 
  plot(subset_data$Time,subset_data$Global_active_power,type="l",xlab="",ylab="Global active power")
  plot(subset_data$Time,subset_data$Voltage,type="l",xlab="",ylab="Voltage")
  plot(subset_data$Time,subset_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subset_data,lines(Time,Sub_metering_1))
  with(subset_data,lines(Time,Sub_metering_2,col="red"))
  with(subset_data,lines(Time,Sub_metering_3,col="blue"))
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)
  plot(subset_data$Time,subset_data$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive power")
  })
dev.off()