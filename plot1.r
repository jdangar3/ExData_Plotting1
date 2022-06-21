#Load Required Packages
library(lubridate)

#Read in data
Raw_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset to specified date range
Subsetted_Data <- subset(Raw_Data, 
                         dmy(Date) %in% c(ymd("2007-02-01",
                                              "2007-02-02")))

#Plot
png(filename = "plot1.png",
    width = 480,
    height = 480)
with(Subsetted_Data, hist(as.numeric(Global_active_power),
                    col = "red", 
                    main = "Global Active Power",
                    xlab = "Global Active Power (kilowats)",
                    ylab = "Frequency"))
dev.off()
