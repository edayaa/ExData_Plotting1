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
pow_cons_input <- subset(house_pow_cons,house_pow_cons$Date =='1/2/2007' | house_pow_cons$Date =='2/2/2007')
pow_cons_input$DateTime <- as.POSIXct(paste(pow_cons_input$Date, pow_cons_input$Time), format="%d/%m/%Y %H:%M:%S")

#pow_cons_input <- filter(house_pow_cons,as.Date(DateTime)=="2007-02-01"| as.Date(DateTime)=="2007-02-02")


###############  Plot to get "Global Active Power" for 02/01/2007 & 02/02/2007 
###############  Copying the Plot into .png devive. 

par(mfrow=c(2,2), mar=c(4,4,2,1))
    #with(pow_cons_input,plot(DateTime,Global_active_power,ylab ="Global Active Power(kilowatts)",type = "l",cex=0.2))
    plot(pow_cons_input$DateTime,pow_cons_input$Global_active_power,ylab ="Global Active Power(kilowatts)",xlab="",type = "l",cex=0.2)
    plot(pow_cons_input$DateTime,pow_cons_input$Voltage,ylab ="Voltage",type = "l",xlab="datetime")
    plot(pow_cons_input$DateTime,pow_cons_input$Sub_metering_1,ylab ="Enery sub metering",type = "l",xlab="")
    lines(pow_cons_input$DateTime,pow_cons_input$Sub_metering_2,type="l",col="red",xlab="")
    lines(pow_cons_input$DateTime,pow_cons_input$Sub_metering_3,type="l",col="blue",xlab="")
    #legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,lwd=2.5,
    #      col=c("black","red","blue"),bty="o")
  #  par(cex=.64)
    plot(pow_cons_input$DateTime,pow_cons_input$Global_reactive_power,ylab ="Global Re-active Power",xlab="datetime",type = "l")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
############### 