rm(list = ls()) ### Cleaning of all Golbal env variables ##########
############### Loadig of required Libraries ###########
library(lattice)
library(data.table)
library(plyr)
library(dplyr)
################ Setting work directory 
setwd("C:\\Eday\\Doc\\R\\download\\exp_analysis")

################  Reading input file 
################  coverting the date string into Date variable
################  selecting data for only Feb/01/2007 7 Feb/02/2007

house_pow_cons <- read.table("household_power_consumption.txt",header = TRUE , stringsAsFactors=FALSE,sep=";",na.strings = "?")

house_pow_cons$Date <- as.Date(house_pow_cons$Date,format = "%d/%m/%Y")
pow_cons_input <- filter(house_pow_cons,Date=="2007-02-01"| Date=="2007-02-02")
#test_df <- head(pow_cons_input)
test_time <- strptime(test_df$Time,format="%H:%M:%S")
#names(pow_cons_input)

###############  Plot Histogram to get "Global Active Power" frequency 
###############  Copying the Plot into .png devive. 
summary(pow_cons_input$Global_active_power)
hist(pow_cons_input$Global_active_power,col="red" , main = " Global Active Power",
     xlab = "Global Active Power(Kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
############### 