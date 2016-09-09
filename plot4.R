## This function re-creates Plot 4 for Coursera's Exploratory Data Analysis Project 1
## using the Electric power consumption dataset.

## The first part of the function reads in and cleans the data while the second part
## of the function creates the graphics.

plot4 <- function(){
  
  ## The following code reads in, subsets and cleans/augments the data.
  
  setwd("C:/Users/Scott Fry/Desktop/Coursera/Exploratory Data Analysis/Assignment 1/Data")
  power <- read.table(file="household_power_consumption.txt",header=T,sep=";",colClasses=
                        c("character","character","character","character","character","character","character",
                          "character","character"))
  power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
  power[power=="?",] <- NA
  power$DateTime <- strptime(paste(power[,1],power[,2]),format="%d/%m/%Y %H:%M:%S")
  power[,3:9] <- sapply(power[,3:9], as.numeric)
  
  ## This part of the code opens a png device, creates the desired graphics and then
  ## closes the png device.
  
  setwd("C:/Users/Scott Fry/Desktop/Coursera/Exploratory Data Analysis/Assignment 1")
  png(filename="plot4.png")
  par(mfrow = c(2,2))
  
  ## Upper Left Plot
  
  with(power, plot(DateTime,Global_active_power, ylab="Global Active Power",
                   xlab=NA, type="l"))
  
  ## Upper Right Plot
  
  with(power, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l"))
  
  ## Lower Left Plot
  
  with(power, plot(DateTime,Sub_metering_1, ylab="Energy sub metering ", xlab=NA, type="l"))
  with(power, points(DateTime,Sub_metering_2,col="red",type="l"))
  with(power, points(DateTime,Sub_metering_3,col="blue",type="l"))
  legend("topright", lwd=1, bty="n", col=c("black","blue","red"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ## Lower Right Plot
  with(power, plot(DateTime, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",
                   type="l"))
  
  dev.off()
}