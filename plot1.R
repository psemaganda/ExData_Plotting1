## Read data from "household_power_consumption.txt" 
## located in the working directory on your computer.

EPC <- read.table("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

## Subseting the data to include only data from the dates 2007-02-01 and 2007-02-02.

EPC <- EPC[EPC$Date == "2007-02-01" | EPC$Date == "2007-02-02", ]

## Transforming the Date variable into a date object.

EPC$Date <- as.Date(x = EPC$Date, format = "%d/%m/%Y")

## Transforming the Time variable into a POSIXct object

EPC$Time <- as.POSIXct(paste(EPC$Date,EPC$Time), format="%Y-%m-%d %H:%M:%S")

## Plot saved to a png file 'plot1.png' in the figure folder.

png(filename = "figure/plot1.png", width = 480, height = 480)
hist(EPC$Global_active_power, main = 'Global Active Power', xlab = "Global Active Power (kilowatts)", col = 'red')
dev.off()


