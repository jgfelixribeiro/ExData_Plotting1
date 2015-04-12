# read the original file
ds_temp <- fread("household_power_consumption.txt")
# filter the original dataset
ds_final <- ds_temp[ds_temp$Date %in% c('1/2/2007', '2/2/2007')]

# create the plot
hist(as.numeric(ds_final$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# save to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()