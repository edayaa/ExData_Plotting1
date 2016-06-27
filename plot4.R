rm(list = ls()) ### Cleaning of all Golbal env variables ##########
############### Loadig of required Libraries ###########
library(lattice)
library(data.table)
library(plyr)
library(dplyr)
################ Setting work directory 
setwd("C:\\Eday\\Doc\\R\\download\\exp_analysis")

################  Reading input file 
################  coverting the date/time string into Date/time variable
################  selecting data for only Feb/01/2007 7 Feb/02/2007

house_pow_cons <- read.table("household_power_consumption.txt",header = TRUE , stringsAsFactors=FALSE,sep=";",na.strings = "?")

house_pow_cons$DateTime <- as.POSIXct(paste(house_pow_cons$Date, house_pow_cons$Time), format="%d/%m/%Y %H:%M:%S")

pow_cons_input <- filter(house_pow_cons,as.Date(DateTime)=="2007-02-01"| as.Date(DateTime)=="2007-02-02")


###############  Plot to get "Global Active Power" for 02/01/2007 & 02/02/2007 
###############  Copying the Plot into .png devive. 

par(mfrow=c(2,2), mar=c(4,4,2,1) , oma=c(0,0,2,0))
    with(pow_cons_input,plot(DateTime,Global_active_power,ylab ="Global Active Power(kilowatts)",type = "l"))
    with(pow_cons_input,plot(DateTime,Voltage,ylab ="Voltage",type = "l"))
    with(pow_cons_input,plot(DateTime,Sub_metering_1,ylab ="Enery sub metering",type = "l"))
        # legend("bottom",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    with(pow_cons_input,points(DateTime,Sub_metering_2,col="red",type = "l"))
    with(pow_cons_input,points(DateTime,Sub_metering_3,col="blue",type = "l"))
  #  par(cex=.64)
    with(pow_cons_input,plot(DateTime,Global_reactive_power,ylab ="Global Re-active Power",type = "l"))

dev.copy(png,file="plot4.png")
dev.off()
############### 