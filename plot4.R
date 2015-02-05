## Read data from "household_power_consumption.txt" 
## located in the working directory on your computer

EPC <- read.table("~/data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

## Transforming the Date variable into a date object

EPC$Date <- as.Date(x = EPC$Date, format = "%d/%m/%Y")

## Subseting the data to include only data from the dates 2007-02-01 and 2007-02-02.

EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02", ]

## Transforming the Time variable into a POSIXct object

EPC$Time <- as.POSIXct(paste(EPC$Date,EPC$Time), format="%Y-%m-%d %H:%M:%S")

## Plot saved as a png file 'plot4.png' in the figure folder.

png(filename = "figure/plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

## plot1
plot(EPC$Time, EPC$Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = 'l')

## plot2
plot(EPC$Time,EPC$Sub_metering_1,xlab = "", ylab = "Energy sub metering", type = 'l')
points(EPC$Time,EPC$Sub_metering_2, type = 'l', col = 'red')
points(EPC$Time,EPC$Sub_metering_3, type = 'l', col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty = 'n', 
       lty = 1, col = c('black','red','blue'))

## plot3
plot(EPC$Time, EPC$Voltage, xlab = "datetime", ylab = "Voltage", type = 'l')

## plot4
plot(EPC$Time, EPC$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = 'l')
dev.off()