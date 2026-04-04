#Correlation analysis
data("ToothGrowth")

#select numeric variables
num_data <- ToothGrowth[, c("len", "dose")]

#compute correlation matrix
corr_matrix <- cor(num_data)

#display correlation matrix
print(corr_matrix)

#correlation heatmap
library(corrplot)

#plot correlation heatmap
setwd('C:/Users/User/Documents/GitHub/TEB2043_DS_24006963/190326_L9')
png(file = "Task 1 Correlation Heatmap.png", width = 1000, height = 600)
corrplot(corr_matrix,
         method = "color",
         addCoef.col = "black",
         type = "upper",
         tl.col = "black")
dev.off()