read.table("household_power_consumption.txt",sep=";",header=T,na.strings = "?" )->power
subset(power,as.Date(power$Date,format="%d/%m/%Y")=="2007-02-01"|as.Date(power$Date,format="%d/%m/%Y")=="2007-02-02") -> powerdata
png("plot1.png")
hist(powerdata$Global_active_power,col="red",main="Global active power",xlab="Global active power (kilowatts)",ylim=c(0,1200))
dev.off()