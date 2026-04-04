setwd('C:/Users/User/Documents/GitHub/TEB2043_DS_24006963/190326_L8')
titanic <- read.csv("titanic_sortbyfare.csv")

#Visualisation 1: Pie Chart - Survival by Gender
png(file = "Task 1 Pie Chart Visual 1.png", width = 1000, height = 600)
gender_survival <- table(titanic$Sex, titanic$Survived)

female_survival <- gender_survival["female",]
male_survival <- gender_survival["male",]

#female gender
par(mfrow = c(1,2))
female_percent <- round(100 * female_survival / sum(female_survival), 1)

female_labels <- c(paste("Did Not Survive (", female_percent[1], "%)", sep = ""),
                   paste("Survived (", female_percent[2], "%)", sep = ""))

pie(female_survival, labels = female_labels,
    main = "Survival Distribution of Female Passengers", 
    col = c("red", "green"))

#male gender
male_percent <- round(100 * male_survival / sum(male_survival), 1)

male_labels <- c(paste("Did Not Survive (", male_percent[1], "%)", sep = ""),
                 paste("Survived (", male_percent[2], "%)", sep = ""))

pie (male_survival, labels = male_labels,
     main = "Survival Distribution of Male Passengers",
     col = c("red", "green"))
par(mfrow = c(1,1))
dev.off()


#Visualisation 2: Box Plot - Fare Distribution by Gender
png(file = "Task 1 Box Plot Visual 2.png", width = 1000, height = 600)
boxplot(Fare~Sex,
        data = titanic,
        col = c("pink", "lightblue"),
        xlab = "Gender",
        ylab = "Fare",
        main = "Fare Distribution by Gender")
dev.off()
