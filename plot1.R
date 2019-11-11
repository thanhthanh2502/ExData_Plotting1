# Download data

energy=read.table("./data/household_power_consumption.txt", sep = ";", colClasses = 'character', header = T)

# Subset data

sub_dat=energy[energy$Date %in% c("1/2/2007","2/2/2007"), ]

# Column class

datetime <- strptime(paste(sub_dat$Date, sub_dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_dat[,3:9]=sapply(sub_dat[,3:9],as.numeric)

# Create PNG file

png(file="plot1.png")
hist(sub_dat$Global_active_power,col = "red", xlab="Global Active Power(kilowatts)", main= "Global Active Power")
dev.off()
