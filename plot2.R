# Reading from the text file and saving the data into table
d = read.table("household_power_consumption.txt", 
               sep=";", 
               col.names=c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3"), 
               fill=FALSE, 
               strip.white=TRUE, header=TRUE)

#Saving the data as a data frame
mydata<-as.data.frame(d)

# Converting the date field as Date
mydata$date = as.Date(mydata$date, format("%d/%m/%Y"))

# Retrieving the two days we need for our study 
mydataSub <- mydat[(mydata$date=="2007-02-01" | mydata$date=="2007-02-02") ,]

# Converting fields which has to be numeric as numeric
mydataSub$global_active_power = as.numeric(as.character(mydataSub$global_active_power))
mydataSub$global_reactive_power = as.numeric(as.character(mydataSub$global_reactive_power))
mydataSub$voltage = as.numeric(as.character(mydataSub$voltage))
mydataSub$sub_metering_1 = as.numeric(as.character(mydataSub$sub_metering_1))
mydataSub$sub_metering_2 = as.numeric(as.character(mydataSub$sub_metering_2))
mydataSub$sub_metering_3 = as.numeric(as.character(mydataSub$sub_metering_3))

# Drawing plot2
plot(strptime(paste(mydataSub$date,mydataSub$time),format="%Y-%m-%d %H:%M:%S"), mydataSub$global_active_power,type="l",ylab='Global Active Power(kilowatts)',xlab="")
dev.copy(png,'plot2.png')
dev.off()
