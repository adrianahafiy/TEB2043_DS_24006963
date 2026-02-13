#create vector 1
V1 <- c(2,3,1,5,4,6,8,7,9)

column.names <- c("COL1", "COL2", "COL3")
row.names <- c("ROW1", "ROW2", "ROW3")
matrix.names <- c("Matrix1", "Matrix2")

#create matrix 1
Matrix1 <- matrix(V1, nrow = 3, byrow = TRUE)

#rename rows and columns
rownames(Matrix1) <- row.names
colnames(Matrix1) <- column.names
#check matrix 1
Matrix1

#transpose matrix 1 to matrix 2
Matrix2 <- t(Matrix1)
rownames(Matrix2) <- row.names
colnames(Matrix2) <- column.names
#check matrix 2
Matrix2

#Perform addition, subtraction, multiplication, division
add_result <- Matrix1 + Matrix2
sub_result <- Matrix1 - Matrix2
mul_result <- Matrix1 * Matrix2
div_result <- Matrix1 / Matrix2

#print everything
cat("Matrix 1: \n"); print (Matrix1); cat("\n")
cat("Matrix 2 (transpose of matrix 1): \n"); print (Matrix2); cat("\n")

cat("Addition(Matrix1 + Matrix2):\n"); print(add_result); cat("\n")
cat("Subtraction(Matrix1 - Matrix2):\n"); print(sub_result); cat("\n")
cat("Multiplication(Matrix1 * Matrix2):\n"); print(mul_result); cat("\n")
cat("Division(Matrix1 / Matrix2):\n"); print(div_result); cat("\n")