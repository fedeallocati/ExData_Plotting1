plot2 <- function()
{
    ## Read household power consumption data
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                     stringsAsFactors=FALSE, header=TRUE)
    
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(data$DateTime, data$Global_active_power, type="l", xlab="",
         ylab="Global Active Power (kilowatts)")
    
    dev.off()
}