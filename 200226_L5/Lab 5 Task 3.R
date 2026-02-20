#Lab 5 Task 3

print("Check whether an n digits number is Armstrong or not: \n")
print("------------------------------------------------------------")

num_input <- as.numeric(readline(prompt = "Input an integer: "))
digits <- integer()
count <- 0L

#seperate the number into individual digits
temp <- num_input
while(temp > 0){
  last_digit <- temp %% 10 #get the last digit
  digits <- c(digits, last_digit)
  temp <- temp %/% 10 #remove last digit
  count <- count + 1 #count amt of digits in the number
}

#power the digits and sum it up
sum_pow <- 0L
for (x in digits){
  sum_pow <- sum_pow + x^count
}

#compare the sum with the original number
if (sum_pow == num_input){
  cat(num_input, "is an Armstrong number.")
} else {
  cat(num_input, "is not an Armstrong number.")
}


