# Import data -- use sqldf to import required data
library(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt", sep = ";",
      sql = "select * from file where  Date in ('1/2/2007', '2/2/2007')", eol = "\n")

# Combine the Date and Time and convert it to Datetime

#power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
#power_consumption$Time <- strptime(power_consumption$Time, "%H:%M:%S")
power_consumption$Datetime <- paste(power_consumption$Date, " ", power_consumption$Time)
power_consumption$Datetime <- strptime(power_consumption$Datetime, "%d/%m/%Y %H:%M:%S")

png(filename = 'plot2.png')

plot(x=power_consumption$Datetime, y=power_consumption$Global_active_power, xlab = '', type = 'l',
     ylab = 'Global Active Power (kilowatts)' )

dev.off()

