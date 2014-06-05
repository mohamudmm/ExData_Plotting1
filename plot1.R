#reads the data from a file in the working directory
exdata2 <- read.csv2("//household_power_consumption.txt",header = FALSE, nrow= 2880, skip = 66637,sep = ";")
#create a vector for the column names
cnames <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Submetering_1','submetering_2','submetering_3')
#attach the column names to the dataframe
colnames(exdata2) <- cname
#open the graphics device
png("plot1.png",width = 480, height = 480)
#plot the histogram of the Global_active_power column
hist(as.numeric(as.character(exdata2$Global_active_power)), col = "Red", xlab = "Global active power(kilowatts", main = "Global active power")
#close the graphic device
dev.off()

