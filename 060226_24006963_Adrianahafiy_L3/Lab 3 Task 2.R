#input name & exam score
student_name <- c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson",
                  "Holland", "Paul", "Simu", "Renner")
exam_score <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)

#turn into list
students_info <- list(Names = student_name, Scores = exam_score)

print(students_info)

#determine highest, lowest, average of the scores& print
highest_score <- max(students_info$Scores)
lowest_score <- min(students_info$Scores)
average_score <- mean(students_info$Scores)

cat("Highest Score: "); print(highest_score); cat("\n")
cat("Lowest Score: "); print(lowest_score); cat("\n")
cat("Average Score: "); print(average_score); cat("\n")

#determine the names of students with highest and lowest scores
idx_max <- which(students_info$Scores == highest_score)
idx_min <- which(students_info$Scores == lowest_score)

student_highest <- students_info$Names[idx_max]
student_lowest <- students_info$Names[idx_min]

cat("Student with highest score: "); print(student_highest); cat("\n")
cat("Student with lowest score: "); print(student_lowest); cat("\n")