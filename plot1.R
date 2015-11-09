# Read the data convert the Date and Time variables to Date/Time classes. 
power_all <- read.table("household_power_consumption.txt",sep  = ";", header = TRUE)
data_wanted <- subset(power_all, Date=="1/2/2007"|Date=="2/2/2007")
Datetime=strptime(paste(data_wanted$Date,data_wanted$Time),format="%d/%m/%Y %H:%M:%S")
# Replace the original Date and Time to a new variable called "Datetime"
data_wanted <- subset(data_wanted,select=-Time)   
data_wanted$Date <- Datetime
colnames(data_wanted)[1] <- "Datetime"

# Plot histogram of Global Active Power
png("plot1.png")
hist(as.numeric(as.character(data_wanted$Global_active_power)),col = "red",xlab = "Global Active Power (kilowatts)")
dev.off()