# Import data -- use sqldf to import required data
library(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt", sep = ";",
      sql = "select * from file where  Date in ('1/2/2007', '2/2/2007')", eol = "\n")

# Combine the Date and Time and convert it to Datetime

power_consumption$Datetime <- paste(power_consumption$Date, " ", power_consumption$Time)
power_consumption$Datetime <- strptime(power_consumption$Datetime, "%d/%m/%Y %H:%M:%S")

png(filename = 'plot3.png')

with(power_consumption, plot(x=Datetime, y = Sub_metering_1, type='l', 
                             col ='black', xlab = '', ylab = "Energy sub metering"))
with(power_consumption, lines(x=Datetime, y = Sub_metering_2, type='l', col='red'))
with(power_consumption, lines(x=Datetime, y = Sub_metering_3, type='l', col='blue'))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

