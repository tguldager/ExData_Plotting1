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

#make plot2
plot(x=elecdat$Datform, y = elecdat$Global_active_power, 
     ylab = "Global active power (kilowatts)", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_active_power) 

#save plot2
png(filename="plot2.png")
plot(x=elecdat$Datform, y = elecdat$Global_active_power, 
     ylab = "Global active power (kilowatts)", xlab = "", type = "n")
lines(x=elecdat$Datform, y = elecdat$Global_active_power) 
dev.off()
