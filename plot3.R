#reads the data from a file in the working directory
exdata2 <- read.csv2("//household_power_consumption.txt",header = FALSE, nrow= 2880, skip = 66637,sep = ";")
#create a vector for the column names
cnames <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Submetering_1','submetering_2','submetering_3')
#attach the column names to the dataframe
colnames(exdata2) <- cnames
#convert the date and time columns and combine the two into datetime column
exdata2$Date <- as.Date(exdata2$Date, format = '%d/%m/%Y')
exdata2$Time <- as.character(exdata2$Time)
exdata2$datetime <- as.POSIXct(paste(exdata2$Date,exdata2$Time))
#open graphic device
png(file = "plot3.png", width = 480, height = 480)
#plot the Energy submetering vs datetime
plot(exdata3$datetime,as.numeric(as.character(exdata3$Submetering_1)),ylab = "Energy submetering",xlab = "",type='l',ylim=c(0,40))
par(new = TRUE)
plot(exdata3$datetime,as.numeric(as.character(exdata3$submetering_2)),ylab = "Energy submetering",xlab = "",type='l',col = 'Red',ylim=c(0,40))
par(new = TRUE)
plot(exdata3$datetime,as.numeric(as.character(exdata3$submetering_3)),ylab = "Energy submetering",xlab = "",type='l',col = 'Blue',ylim = c(0,40))
legend("topright",c("submetering_1","submetering_2","submetering_3"),col=c("Black","Red","Blue"),lty=5)
#close graphics device
dev.off()


#close graphic device
dev.off()





