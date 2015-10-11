# plot1.R

datHPC <- read.table( "./data/household_power_consumption.txt", header=TRUE,
                      stringsAsFactors=FALSE, sep=';', dec="." )
subdatHPC <- datHPC[datHPC$Date %in% c("1/2/2007","2/2/2007"),]

varGAP <- as.numeric(subdatHPC$Global_active_power)

par(mfrow=c(1,1))

hist(varGAP,
     main="Golbal Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()


