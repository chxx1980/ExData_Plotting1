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

## plot 3
with(ds, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)

## save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()