#input name & exam score
student_name <- c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson",
                  "Holland", "Paul", "Simu", "Renner")
chem_score <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
phy_score <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)

#turn into list
students_info <- list(Names = student_name, Chemistry = chem_score, Physics = phy_score)

print(students_info)

#fail count
fail_chemistry <- sum(students_info$Chemistry <= 49)
fail_physics <- sum(students_info$Physics <= 49)

#highest score per subject
max_chem <- max(students_info$Chemistry)
max_phy <- max(students_info$Physics)

top_chem_students <- students_info$Names[students_info$Chemistry == max_chem]
top_phys_students <- students_info$Names[students_info$Physics   == max_phy]

#print everything
cat("Fails (Chemistry <= 49):", fail_chemistry, "\n")
cat("Fails (Physics   <= 49):", fail_physics,   "\n")
cat("Highest Chemistry:", max_chem, "by", paste(top_chem_students, collapse = ", "), "\n")
cat("Highest Physics:  ", max_phy,   "by", paste(top_phys_students, collapse = ", "), "\n")