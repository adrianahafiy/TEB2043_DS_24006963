string1 <- (readline(prompt = "Enter string 1: "))
string2 <- (readline(prompt = "Enter string 2: "))

#change strings to lower case to make it case insensitive
check <- tolower(string1) == tolower(string2)

cat("This program compares the 2 strings. Both inputs are similar: ", check)
