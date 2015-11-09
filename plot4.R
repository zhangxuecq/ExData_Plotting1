# Read the data convert the Date and Time variables to Date/Time classes. 
power_all <- read.table("household_power_consumption.txt",sep  = ";", header = TRUE)
data_wanted <- subset(power_all, Date=="1/2/2007"|Date=="2/2/2007")
Datetime=strptime(paste(data_wanted$Date,data_wanted$Time),format="%d/%m/%Y %H:%M:%S")
# Replace the original Date and Time to a new variable called "Datetime"
data_wanted <- subset(data_wanted,select=-Time)   
data_wanted$Date <- Datetime
colnames(data_wanted)[1] <- "Datetime"

# Plot 4 variables time in one figure.
png("plot4.png")
par(mfrow=c(2,2))
plot(data_wanted$Datetime,as.numeric(as.character(data_wanted$Global_active_power)),type = "l",xlab = "", ylab = "Global Active Power")
plot(data_wanted$Datetime,as.numeric(as.character(data_wanted$Voltage)),type = "l",xlab = "daytime", ylab = "Voltage")
plot(data_wanted$Datetime,as.numeric(as.character(data_wanted$Sub_metering_1)),type = "l",col="black",xlab = "", ylab = "Energy sub metering")
lines(data_wanted$Datetime,as.numeric(as.character(data_wanted$Sub_metering_2)),col="red")
lines(data_wanted$Datetime,as.numeric(as.character(data_wanted$Sub_metering_3)),col="blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
plot(data_wanted$Datetime,as.numeric(as.character(data_wanted$Global_reactive_power)),type = "l",xlab = "daytime", ylab = "Global reactive power")
dev.off()