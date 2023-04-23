data = read.table('C:/Users/Mariela/Desktop/Jade tareas/Curso Cienciade Datos/R/datasciencecoursera/household_power_consumption.txt',
                  skip=1,sep=";")
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
               "Sub_metering_3")

subset_data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

subset_data$Date<-as.Date(subset_data$Date,format="%d/%m/%Y")
subset_data$Time<-strptime(subset_data$Time,format="%H:%M:%S")

subset_data[1:1440,"Time"]<-format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"]<-format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("Plot3.png",width = 480,height = 480)

plot(subset_data$Time,subset_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("toprigth",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
