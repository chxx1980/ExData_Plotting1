#plot3 for coursera

#read data
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, stringsAsFactors=F,sep=";", na.strings="?")

#convert to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset relevant data
ds <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


##cleanup unused dataset
rm(data)

## convert dates
datetime <- paste(as.Date(ds$Date), ds$Time)
ds$Datetime <- as.POSIXct(datetime)

## plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(ds, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

## save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()