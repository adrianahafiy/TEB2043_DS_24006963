#identify and setting the folder path
#get working directory then store 'titanic.csv' in the same folder as R script
getwd()

#other option: set own working directory
setwd('C:/Users/User/Documents/GitHub/TEB2043_DS_24006963/040326_L7')

#ensure the file is stored in the correct working directory
list.files)()

# 1) import csv file
titanic <- read.csv("titanic.csv")
View(titanic)


# 2) identify NA in data frame
#count the total NA values
sum(is.na(titanic))

#get count of NA in each column
print(sapply(titanic, function(x) sum(is.na(x))))


# 3) manage the NAs
dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)


# 4) filter values
#import library
install.packages("dplyr")
library(dplyr)

#get the columns name
colnames(titanic_cleaned)
#alternatively can write
names(titanic_cleaned)

#filter values
print(filter(titanic_cleaned, Sex == 'female'))
print(filter(titanic_cleaned, Fare > 500))
print(filter(titanic_cleaned, Embarked == "C"))

#filter data by multiple conditions
print(filter(titanic_cleaned, Sex == 'female' & Fare > 500))
#alternatively can write
titanic_cleaned %>% filter (Sex == 'female', Fare > 500)


# 5) Sort values
#ascending order
titanic_sortbyfare = arrange(titanic_cleaned, Fare)
View(titanic_sortbyfare)

#descending order
titanic_sortbyfare = arrange(titanic_cleaned, desc(Fare))
View(titanic_sortbyfare)


# 6) Export data to csv
write.csv(titanic_sortbyfare, "titanic_sortbyfare.csv")