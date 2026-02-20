#Lab 5 Task 2
#Input integer
integer <- as.numeric(readline(prompt = "Input an integer: "))

for (x in 1:integer){
  cubed <- x^3
  cat("Number is:", x, "and cube of the", x, "is:", cubed, "\n")
}
