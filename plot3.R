#Load Required Packages
library(lubridate)

#Read in data
Raw_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset to specified date range
Subsetted_Data <- subset(Raw_Data, 
                         dmy(Date) %in% c(ymd("2007-02-01",
                                              "2007-02-02")))

#Plot
png(filename = "plot3.png",
    width = 480,
    height = 480)
with(Subsetted_Data, plot(dmy(Date)+hms(Time),
                          as.numeric(Sub_metering_1),
                          ylab = "Energy sub metering",
                          type = "n",
                          xlab = ""))
with(Subsetted_Data, lines(dmy(Date)+hms(Time), 
                           as.numeric(Sub_metering_1), 
                           type = "l",
                           col = "black"))
with(Subsetted_Data, lines(dmy(Date)+hms(Time), 
                           as.numeric(Sub_metering_2), 
                           type = "l",
                           col = "red"))
with(Subsetted_Data, lines(dmy(Date)+hms(Time), 
                           as.numeric(Sub_metering_3), 
                           type = "l",
                           col = "blue"))
legend("topright",
       lty = 1,
       col = c("black",
               "red",
               "blue"),
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"))
dev.off()

