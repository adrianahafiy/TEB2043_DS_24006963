#user input height and weight
weight <- as.numeric(readline(prompt = "Enter weight (kg): "))
height <- as.numeric(readline(prompt = "Enter height (m): "))

#calculate BMI
bmi = weight / height^2

print(paste("BMI =", bmi))

#classify the bmi classes
underweight <- bmi <= 18.4
normal <- bmi >=18.5 & bmi <= 24.9
overweight <- bmi >= 25.0 & bmi <= 39.9
obese <- bmi >= 40.0

#print the output
cat("Underweight: ", underweight, "\n")
cat("Normal: ", normal, "\n")
cat("Overweight: ", overweight, "\n")
cat("Obese: ", obese, "\n")

