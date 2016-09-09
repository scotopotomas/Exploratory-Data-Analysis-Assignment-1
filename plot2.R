## This function re-creates Plot 2 for Coursera's Exploratory Data Analysis Project 1
## using the Electric power consumption dataset.

## The first part of the function reads in and cleans the data while the second part
## of the function creates the graphics.

plot2 <- function(){
  
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
  png(filename="plot2.png")
  with(power, plot(DateTime,Global_active_power, ylab="Global Active Power (kilowatts)",
  xlab=NA, type="l"))
  dev.off()
}