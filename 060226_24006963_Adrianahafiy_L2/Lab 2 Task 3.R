#user input name & phone number
name <- readline(prompt = "Enter name: ")
phoneNum <- readline(prompt = "Enter phone number: ")

#convert name to upper case
upperName <- toupper(trimws(name))

#first 3 digits in phone number
first3 <- substr(phoneNum, 1, 3)

#last 4 digits in phone number
last4 <- substr(phoneNum, nchar(phoneNum) - 3, nchar(phoneNum))

#masked number
masked <- paste0(first3, "-xxxxx ", last4)

cat("Hi, ", upperName, ". A verification code has been sent to ", masked, "\n", sep="")
