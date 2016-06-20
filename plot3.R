read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?" )->power
subset(power,as.Date(power$Date,format="%d/%m/%Y")=="2007-02-01"|as.Date(power$Date,format="%d/%m/%Y")=="2007-02-02") -> powerdata
powerdata$datetime<-paste(powerdata$Date,powerdata$Time)
powerdata$datetime <-strptime(powerdata$datetime,format="%d/%m/20%y %H:%M:%S")

png("plot3.png")
with(powerdata,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering"))
lines(powerdata$datetime,powerdata$Sub_metering_1)
lines(powerdata$datetime,powerdata$Sub_metering_2,col="red")
lines(powerdata$datetime,powerdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()