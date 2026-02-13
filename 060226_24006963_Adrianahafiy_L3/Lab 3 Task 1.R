#input marks vector
marks <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

#determine sum of students for each grade
grade_A <- sum(marks >= 90 & marks <= 100)
grade_B <- sum(marks >= 80 & marks <=89)
grade_C <- sum(marks >= 70 & marks <=79)
grade_D <- sum(marks >=60 & marks <= 69)
grade_E <- sum(marks >=50 & marks <= 59)
grade_F <- sum(marks <=49)

#print every grade sum
print(grade_A)
print(grade_B)
print(grade_C)
print(grade_D)
print(grade_E)
print(grade_F)

#check whether marks pass or fail 
passed <- marks > 49
print(passed)

#list the results & print
result <- list(Marks = marks, PassStatus = passed, GradeCount = c(A = grade_A, B = grade_B, C = grade_C, D = grade_D, E = grade_E, F = grade_F))
print(result)