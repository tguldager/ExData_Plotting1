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

#plot3 code
plot(x=elecdat$Datform, y = elecdat$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Sub_metering_1)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_2, col = 2)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_3, col = 4)
legend("topright", lty=1, col = c(1,2,4),names(elecdat[7:9]))

#save plot 3
png(filename="plot3.png")
plot(x=elecdat$Datform, y = elecdat$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Sub_metering_1)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_2, col = 2)
lines(x=elecdat$Datform, y = elecdat$Sub_metering_3, col = 4)
legend("topright", lty=1, col = c(1,2,4),names(elecdat[7:9]))
dev.off()
