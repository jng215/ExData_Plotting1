# plot2.R

datHPC <- read.table( "./data/household_power_consumption.txt", header=TRUE,
                      stringsAsFactors=FALSE, sep=';', dec="." )
subdatHPC <- subset(datHPC, datHPC$Date=="1/2/2007" | datHPC$Date=="2/2/2007") 
varGAP <- as.numeric(subdatHPC$Global_active_power)
varDT <- strptime(paste(subdatHPC$Date, subdatHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow=c(1,1))

plot( varDT, varGAP, type="l",
      main="", xlab="", ylab="Global Active Power (kilowatts)",
      cex=0.8, col="black" )
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()

