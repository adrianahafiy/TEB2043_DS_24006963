#load Theoph data
data(Theoph)
head(Theoph)

#create the relationship model
#predictor vector = weight
x <- Theoph$Wt

#response vector = dose
y <- Theoph$Dose

model <- lm(y~x)
print(model)

#model summary
summary(model)

#predict dose for weight 90, 95, 100
newWeight <- data.frame(x = c(90, 95, 100))
predictedDose <- predict(model, newWeight)
print(predictedDose)

#visualise
plot(x, y, 
     col = "blue", 
     main = "Dose vs Weight Regression", 
     xlab = "Weight (kg)",
     ylab = "Dose (mg/kg)",
     pch = 16)
abline(model, col = "red", lwd = 2)

