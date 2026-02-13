#create array 1
vector1 <- 1:24
Array1 <- array(vector1, dim = c(2, 4, 3))
Array1

#create array 2
vector2 <- 25:54
Array2 <- array(vector2, dim = c(3, 2, 5))
Array2

cat("The second row of the second matrix of array 1: \n"); 
print(Array1[2,,2]); cat("\n")

cat("The element in the 3rd row and 2nd column of the 1st matrix of array 2: \n");
print(Array2[3, 2, 1]); cat("\n")
