library("data.table")


lol <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

lol[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


lol[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


lol <- lol[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)


plot(x = lol[, dateTime]
     , y = lol[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()