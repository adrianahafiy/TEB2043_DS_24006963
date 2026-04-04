setwd('C:/Users/User/Documents/GitHub/TEB2043_DS_24006963/190326_L8')

#load built in dataset AirPassengers
data("AirPassengers")

#Visualisation 1:Line Graph - Airline Passenger Trend
png(file = "Task 2 Line Graph Visual 1.png", width = 1000, height = 600)

plot(AirPassengers,
     type = "o",
     col = "blue",
     xlab = "Year",
     ylab = "Number of Passengers (in thousands)",
     main = "Trend of International Airline Passengers (1949-1960)")

dev.off()


#Visualisation 2: Histogram - Distribution of Passenger Numbers
png(file = "Task 2 Histogram Visual 2.png", width = 1000, height = 600)

hist(AirPassengers,
     col = "lightblue",
     border = "black",
     xlab = "Number of Passengers (in thousands)",
     main = "Distribution of Airline Passenger Numbers")

dev.off()