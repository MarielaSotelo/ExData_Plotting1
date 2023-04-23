data = read.table('C:/Users/Mariela/Desktop/Jade tareas/Curso Cienciade Datos/R/datasciencecoursera/household_power_consumption.txt',
                  skip=1,sep=";")
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
               "Sub_metering_3")

subset_data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
png("Plot1.png",width = 480,height = 480)
hist(as.numeric(as.character(subset_data$Global_active_power)), col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

