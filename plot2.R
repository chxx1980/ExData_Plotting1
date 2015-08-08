#plot2 for coursera

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

## plot
plot(ds$Global_active_power~ds$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
