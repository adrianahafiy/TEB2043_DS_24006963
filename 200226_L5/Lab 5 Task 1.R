#Lab 5 Question 1
#Input year
year <- as.numeric(readline(prompt = "Input year: "))

#calculate leap year
if ((year %% 400 == 0) || ((year %% 4 == 0) && (year %% 100 != 0))){
  cat("Output:", year, "is a leap year.")
} else {
  cat("Output:", year, "is not a leap year.")
}

