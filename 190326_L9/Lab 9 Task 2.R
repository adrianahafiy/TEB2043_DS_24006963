#normalisation analysis
data(mtcars)

#log transformation
log_mtcars <- log(mtcars)
summary(log_mtcars)


#standard scaling (z-score normalisation)
scaled_mtcars <- as.data.frame(scale(mtcars))
summary(scaled_mtcars)


#min-max scaling
library(caret)

minmax_model <- preProcess(mtcars, method = "range")
minmax_mtcars <- predict(minmax_model, mtcars)
summary(minmax_mtcars)