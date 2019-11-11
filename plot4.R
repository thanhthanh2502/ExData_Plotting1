# Download data

energy=read.table("./data/household_power_consumption.txt", sep = ";", colClasses = 'character', header = T)

# Subset data

sub_dat=energy[energy$Date %in% c("1/2/2007","2/2/2007"), ]

# Column class

datetime <- strptime(paste(sub_dat$Date, sub_dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_dat[,3:9]=sapply(sub_dat[,3:9],as.numeric)

# Create PNG file

png("plot4.png")
par(mfrow=c(2,2))
plot(datetime,sub_dat$Global_active_power,type='l',xlab = "",ylab = "Global Active Power")
plot(datetime,sub_dat$Voltage,type='l',xlab = "datetime",ylab = "Voltage")
plot(datetime,sub_dat$Sub_metering_1,type='l',col='black',xlab = "",ylab = "Energy Sub metering")
lines(datetime,sub_dat$Sub_metering_2,col='red')
lines(datetime,sub_dat$Sub_metering_3,col='blue')
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty='n')
plot(datetime,sub_dat$Global_reactive_power,type='l',xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
