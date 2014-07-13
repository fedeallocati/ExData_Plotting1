plot1 <- function()
{
    ## Read household power consumption data
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
                     stringsAsFactors=FALSE, header=TRUE)

    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    hist(data$Global_active_power, main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
    dev.off()
}