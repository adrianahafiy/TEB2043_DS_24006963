#create table
emp.data <- data.frame(
  name = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas"),
  score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0),
  attempts = c(1, 3, 2, 3, 2, 1, 2)
)
print(emp.data)

#add qualify column
emp.data$qualify <- c("yes", "no", "yes", "no", "no", "no", "yes" )
print(emp.data)

#add data
emp.newdata <- data.frame(
  name = c("Emily"),
  score = c(14.5),
  attempts = c (1), 
  qualify = c("yes")
)

emp.finaldata <- rbind(emp.data, emp.newdata)
print(emp.finaldata)

#display structure
str(emp.finaldata)

#change qualify column data type then summarise
emp.finaldata$qualify <- factor(emp.finaldata$qualify, levels = c("no", "yes"))
print(summary(emp.finaldata))

