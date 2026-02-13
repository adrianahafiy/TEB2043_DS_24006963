#create age vector
age <- c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,
        52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)
age_factor <- factor(age)
levels(age_factor)

#put the ages into tables
table(age_factor)

#create vector for age range
age_range <- c()
age_range <- ifelse(age <= 52, "50-52",
                    ifelse(age <= 54, "52-54",
                           ifelse(age <= 56, "54-56",
                                  ifelse(age <= 58, "56-58", "58-60"))))
age_range_factor <- factor(age_range, levels = c("50-52", "52-54", "54-56", "56-58", "58-60"))
table(age_range_factor)