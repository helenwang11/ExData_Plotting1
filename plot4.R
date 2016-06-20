read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?" )->power
subset(power,as.Date(power$Date,format="%d/%m/%Y")=="2007-02-01"|as.Date(power$Date,format="%d/%m/%Y")=="2007-02-02") -> powerdata
powerdata$datetime<-paste(powerdata$Date,powerdata$Time)
powerdata$datetime <-strptime(powerdata$datetime,format="%d/%m/20%y %H:%M:%S")

png("plot4.png")

par(mfcol=c(2,2))
with(powerdata,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"))

with(powerdata,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering"))
lines(powerdata$datetime,powerdata$Sub_metering_1)
lines(powerdata$datetime,powerdata$Sub_metering_2,col="red")
lines(powerdata$datetime,powerdata$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",lty=c(1,1,1))

with(powerdata,plot(datetime,Voltage,type="l"))

with(powerdata,plot(datetime,Global_reactive_power,type="l"))

dev.off()