# read the original file
ds_temp <- fread("household_power_consumption.txt")
# filter the original dataset
ds_final <- ds_temp[ds_temp$Date %in% c('1/2/2007', '2/2/2007')]
# Cast the date field
ds_final$Date <- as.Date(ds_final$Date, format="%d/%m/%Y")
dt_formatted <- paste(as.Date(ds_final$Date), ds_final$Time)
ds_final$DateFormatted <- as.POSIXct(dt_formatted)

# create the plot
plot(ds_final$Global_active_power~ds_final$DateFormatted, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
# save to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()