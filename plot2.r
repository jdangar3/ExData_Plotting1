#Load Required Packages
library(lubridate)

#Read in data
Raw_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset to specified date range
Subsetted_Data <- subset(Raw_Data, 
                         dmy(Date) %in% c(ymd("2007-02-01",
                                              "2007-02-02")))

#Plot
png(filename = "plot2.png",
    width = 480,
    height = 480)
with(Subsetted_Data, plot(dmy(Date)+hms(Time),
                          Global_active_power,
                          ylab = "Global Active Power (kilowatts)",
                          type = "n",
                          xlab = ""))
with(Subsetted_Data, lines(dmy(Date)+hms(Time), 
                           Global_active_power, 
                           type = "l"))
dev.off()
