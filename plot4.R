plot4 <- function(){
    #Load library()
    library(sqldf)
    
    #read file
    td<-read.csv.sql("Project-1/household_power_consumption.txt",
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header = TRUE,
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     nrows = 10, sep = ";")
    
    #change column to date class
    td$Date <- as.Date(td$Date, "%d/%m/%Y")
    #create dateTimecolumn
    td$DateTime <- as.POSIXlt( strptime(paste(td$Date, td$Time), "%Y-%m-%d %H:%M:%S"))
    
    #plot4
    png("plot4.png", width = 480, height = 480)
    
    par(mfcol = c(2, 2), mar = c(4, 4, 1, 2), oma = c(1, 0, 0, 0))
    
    plot(x<-td$DateTime, y<- td$Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power")
    
    plot(x<-td$DateTime, y<- td$Sub_metering_1, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    points(x<-td$DateTime, y<- td$Sub_metering_2, type = "l", col="red")
    points(x<-td$DateTime, y<- td$Sub_metering_3, type = "l", col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty = 1, bty = "n")
    
    plot(x<-td$DateTime, y<- td$Voltage, type = "l", 
         xlab = "datetime", ylab = "Voltage")
    
    plot(x<-td$DateTime, y<- td$Global_reactive_power, type = "l", 
         xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
    
}