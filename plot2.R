## Read data from "household_power_consumption.txt" 
## located in the working directory on your computer.

EPC <- read.table("~/data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

## Transforming the Date variable into a date object.

EPC$Date <- as.Date(x = EPC$Date, format = "%d/%m/%Y")

## Subseting the data to include only data from the dates '2007-02-01' and '2007-02-02'.

EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02", ]

## Transforming the Time variable into a POSIXct object

EPC$Time <- as.POSIXct(paste(EPC$Date,EPC$Time), format="%Y-%m-%d %H:%M:%S")

## Plot saved to a png file 'plot2.png' in the figure folder.

png(filename = "figure/plot2.png", width = 480, height = 480)
plot(EPC$Time, EPC$Global_active_power, xlab = "", 
ylab = "Global Active Power (kilowatts)", type = 'l')
dev.off()