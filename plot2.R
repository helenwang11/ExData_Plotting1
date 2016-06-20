read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?" )->power
subset(power,as.Date(power$Date,format="%d/%m/%Y")=="2007-02-01"|as.Date(power$Date,format="%d/%m/%Y")=="2007-02-02") -> powerdata
powerdata$datetime<-paste(powerdata$Date,powerdata$Time)
powerdata$datetime <-strptime(powerdata$datetime,format="%d/%m/20%y %H:%M:%S")
png("plot2.png")
with(powerdata,plot(datetime,Global_active_power,type="l",ylab="Global Active Power(kilowatts)"))
dev.off()
