# plot4.R

datHPC <- read.table( "./data/household_power_consumption.txt", header=TRUE,
                      stringsAsFactors=FALSE, sep=';', dec="." )
subdatHPC <- datHPC[datHPC$Date %in% c("1/2/2007","2/2/2007"),]

varGAP <- as.numeric(subdatHPC$Global_active_power)
varDT <- strptime(paste(subdatHPC$Date, subdatHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
varSM1 <- as.numeric(subdatHPC$Sub_metering_1)
varSM2 <- as.numeric(subdatHPC$Sub_metering_2)
varSM3 <- as.numeric(subdatHPC$Sub_metering_3)

varVoltage <- as.numeric(subdatHPC$Voltage)
varGRP <- as.numeric(subdatHPC$Global_reactive_power)

par(mfrow=c(2,2))

plot( varDT, varGAP, type="l",
      main="", xlab="", ylab="Global Active Power",
      cex=0.8, col="black" )

plot( varDT, varVoltage, type="l", 
      main="", xlab="datetime", ylab="Voltage",
      cex=0.8, col="black" )

plot( varDT, varSM1, type="l", 
      main="", xlab="", ylab="Engergy sub metering",
      col="black" )
lines( varDT, varSM2, col="red")
lines( varDT, varSM3, col="blue")
legend( "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,
        lty=1, bty="n", col=c("black", "red", "blue") )

plot( varDT, varGRP, type="l", 
      main="", xlab="datetime", ylab="Global_reactive_power",
      cex=0.8, col="black" )

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
