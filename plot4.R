# read the original file
ds_temp <- fread("household_power_consumption.txt")
# filter the original dataset
ds_final <- ds_temp[ds_temp$Date %in% c('1/2/2007', '2/2/2007')]
# Cast the date field
ds_final$Date <- as.Date(ds_final$Date, format="%d/%m/%Y")
dt_formatted <- paste(as.Date(ds_final$Date), ds_final$Time)
ds_final$DateFormatted <- as.POSIXct(dt_formatted)

# create the plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(ds_final, {
  plot(Global_active_power~DateFormatted, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateFormatted, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateFormatted, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateFormatted,col='Red')
  lines(Sub_metering_3~DateFormatted,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), , cex=0.7, pch=1, pt.cex = 1)
  plot(Global_reactive_power~DateFormatted, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
# save to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()