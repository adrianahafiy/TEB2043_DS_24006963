#load packages
library(e1071)
library(caTools)
library(class)

#load ChickWeight data
data(ChickWeight)
head(ChickWeight)

#prepare data
chicks <- ChickWeight[, c("weight", "Time", "Diet")]
chicks$Diet <- as.factor(chicks$Diet)

#split data into train & test data
set.seed(123) #for reproducibility
split <- sample.split(chicks$Diet, SplitRatio = 0.7)
train <- subset(chicks, split == TRUE)
test <- subset(chicks, split == FALSE)

#feature scaling
train_scale <- scale(train[, 1:2])
test_scale <- scale(test[,1:2])

#run KNN for different K values
accuracy <- c()

for(k in c(1,5,15,25,35,45,55,65,75,85,95)){
  knn_pred <- knn(
    train = train_scale,
    test = test_scale,
    cl = train$Diet,
    k = k
  )
  
  acc <- mean(knn_pred == test$Diet)
  accuracy <- c(accuracy, acc)
  
  print(paste("K=", k, "Accuracy =", acc))
}

#optimal K = 95
optimalK <- 95
finalPrediction <- knn(
  train = train_scale,
  test = test_scale,
  cl = train$Diet,
  k = optimalK
)

#confusion matrix
cm <- table(Actual = test$Diet, Predicted = finalPrediction)
print(cm)

