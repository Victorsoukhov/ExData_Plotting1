plot2 <- function(){
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
    
    #plot2
    png("plot2.png", width = 480, height = 480)
    plot(x<-td$DateTime, y<- td$Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power")
    
    dev.off()
    
}