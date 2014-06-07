#reads the data from a file in the working directory
exdata2 <- read.csv2("household_power_consumption.txt",header = FALSE, nrow= 2880, skip = 66637,sep = ";")
#create a vector for the column names
cnames <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Submetering_1','submetering_2','submetering_3')
#attach the column names to the dataframe
colnames(exdata2) <- cnames
#convert the date and time columns and combine the two into datetime column
exdata2$Date <- as.Date(exdata2$Date, format = '%d/%m/%Y')
exdata2$Time <- as.character(exdata2$Time)
exdata2$datetime <- as.POSIXct(paste(exdata2$Date,exdata2$Time))
#open graphic device
png(file = "plot2.png", width = 480, height = 480)
#plot the Global active power vs datetime
plot(exdata2$datetime,as.numeric(as.character(exdata2$Global_active_power)),type='l',ylab = "Global active power(kilowatts)",xlab = "")
#close graphic device
dev.off()





