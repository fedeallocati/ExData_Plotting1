plot3 <- function()
{
    ## Read household power consumption data
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                     stringsAsFactors=FALSE, header=TRUE)
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    Sys.setlocale("LC_TIME", "English")
    
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
    lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}