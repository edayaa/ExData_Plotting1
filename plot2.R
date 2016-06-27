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


###############  Plot Histogram to get "Global Active Power" for 02/01/2007 & 02/02/2007 
###############  Copying the Plot into .png devive. 

with(pow_cons_input,plot(DateTime,Global_active_power,ylab ="Global Active Power(kilowatts)",type = "l"))
dev.copy(png,file="plot2.png")
dev.off()
############### 