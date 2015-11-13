#Get data
elecdat_all<- read.table("household_power_consumption.txt", sep= ";", header = TRUE, 
                         na.strings = "?", stringsAsFactors = FALSE, 
                         colClasses = c("character", "character", rep("numeric",7)))

#Save data of the relevant days
elecdat <-elecdat_all[elecdat_all$Date %in% c("1/2/2007","2/2/2007"),] 

#skip the rest
rm(elecdat_all)

#save data and time in a new column in POSIXltformat
elecdat$Datform<- 
  strptime(paste(as.Date((elecdat$Date), "%d/%m/%Y"), (elecdat$Time)), 
           format= "%Y-%m-%d %H:%M:%S")

# code for plot 4
par(mfrow=c(2, 2))
#plot 4.1
plot(x=elecdat$Datform, y = elecdat$Global_active_power, 
     ylab = "Global active power", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_active_power) 
#plot4.2
plot(x=elecdat$Datform, y = elecdat$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(x=elecdat$Datform, y = elecdat$Voltage)
#plot 4.3
plot(x=elecdat$Datform, y = elecdat$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Sub_metering_1)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_2, col = 2)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_3, col = 4)
legend("topright", lty=1, col = c(1,2,4),names(elecdat[7:9]), bty = "n")
#plot 4.4
plot(x=elecdat$Datform, y = elecdat$Global_reactive_power, xlab = "datetime", 
     ylab = "Global reactive power", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_reactive_power)

#save plot 4 
png(filename = "plot4.png")
par(mfrow=c(2, 2))
#plot 4.1
plot(x=elecdat$Datform, y = elecdat$Global_active_power, 
     ylab = "Global active power", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_active_power) 
#plot4.2
plot(x=elecdat$Datform, y = elecdat$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(x=elecdat$Datform, y = elecdat$Voltage)
#plot 4.3
plot(x=elecdat$Datform, y = elecdat$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Sub_metering_1)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_2, col = 2)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_3, col = 4)
legend("topright", lty=1, col = c(1,2,4),names(elecdat[7:9]), bty = "n")
#plot 4.4
plot(x=elecdat$Datform, y = elecdat$Global_reactive_power, xlab = "datetime", 
     ylab = "Global reactive power", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_reactive_power)
dev.off()

par(mfrow=c(1,1))