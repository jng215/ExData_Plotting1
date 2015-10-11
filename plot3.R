# plot3.R

datHPC <- read.table( "./data/household_power_consumption.txt", header=TRUE,
                      stringsAsFactors=FALSE, sep=';', dec="." )
subdatHPC <- datHPC[datHPC$Date %in% c("1/2/2007","2/2/2007"),]

varGAP <- as.numeric(subdatHPC$Global_active_power)
varDT <- strptime(paste(subdatHPC$Date, subdatHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
varSM1 <- as.numeric(subdatHPC$Sub_metering_1)
varSM2 <- as.numeric(subdatHPC$Sub_metering_2)
varSM3 <- as.numeric(subdatHPC$Sub_metering_3)

par(mfrow=c(1,1))

plot( varDT, varSM1, type="l", 
      main="", xlab="", ylab="Engergy sub metering",
      cex=0.8, col="black" )
lines( varDT, varSM2, col="red")
lines( varDT, varSM3, col="blue")

legend( "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,
        lty=1, lwd=2, col=c("black", "red", "blue") )

dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()
