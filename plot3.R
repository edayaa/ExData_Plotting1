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


###############  Plot to get "Global Active Power" for 02/01/2007 & 02/02/2007 
###############  Copying the Plot into .png devive. 
#png("plot3.png",width = 480,height = 480)
with(pow_cons_input,plot(DateTime,Sub_metering_1,ylab ="Enery sub metering",type = "l"))
with(pow_cons_input,points(DateTime,Sub_metering_2,col="red",type = "l"))
with(pow_cons_input,points(DateTime,Sub_metering_3,col="blue",type = "l"))
par(cex=.42)
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty=1,col= c("black","red","blue"))
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
############### 