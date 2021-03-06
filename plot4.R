plot4 <- function()
{
    ## Read household power consumption data
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                     stringsAsFactors=FALSE, header=TRUE)
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    Sys.setlocale("LC_TIME", "English")
    
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
    par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    
    plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")    
    plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
    lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
    
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

    plot(data$DateTime, data$Global_reactive_power, xlab="datetime",
         ylab="Global_reactive_power", type="l")

    dev.off()
}