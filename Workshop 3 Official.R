#2.3 questions
for (i in 1:5) {  # create a for loop that runs 5 times (1 to 5)
  print(i)        # each time the for loop runs, print the value of i
}

# consider the following code

x <- 0            # make a new scalar called x with a value of 0

for (i in 1:2) { # create a for loop that runs 10 times (1 to 10)
  x <- x + i      # within our for loop we are adding the value of i to the value of x
  print(x)
}

# the value of x becomes 55 from 0 
# (0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10).


#4)

for (i in 1:20)
  print (i*i)

# 2.4 - 
# e.g

shrek_quote <- c('What', 'are', 'you', 'doing', 'in', 'my', 'swamp')
for (word in shrek_quote) {
  print(toupper(word))  
}

for (donkey in 1:length(shrek_quote)) {
  print(toupper(shrek_quote[donkey]))  
}

# Section 3

output <- vector() # creates an empty vector that we can fill with values 
input <- c('red', 'yellow', 'green', 'orange', 'purple')
for (i in 1:length(input)) {
  #for every element (i), in input ; output will be the length of each word in input
  output[i] <- nchar(input[i])
}
print(output)

# Creating loop called fruits

fruit_char <- vector()

fruits <- c('apple', 'tangerine', 'kiwi', 'banana')

for (f in 1:length(fruits)) {
  fruit_char[f] <- paste(fruits[f], '_',nchar(fruits[f]))
}
print(fruit_char)

# create vector of fruits
# function that adds an _ and nchar
# saves them --> a new vector called fruit_chars
# hint: paste() 


#Section 4
# 4.1

numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i > 5){
    print(i)
  }
}
# function: if any of the elements in the vector are greater than 5, 
# they are printed

#4.1

numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  }
}
# for any number in the numbers list that is less than five, and
# an integer (so when %% 1 results in 0 remainder), they = printed

# my own example
nums <- c(11, 22, 33, -0.01, 25, 100000,
          7.2, 0.3, -2000, 20, 17, -11, 0)

for(n in nums){
  if(n > 0 & n %% 5 == 0){
    print(paste(n, ' is greater than 0 and a multiple of 5', sep='.'))
  }
  else if (n < 0){
    print(paste(n, 'is a negative number'))
  }
  else if (n %% 1 != 0){
    print(paste(n,'is not an integer', sep=' '))
  }
  else{print(n)} #if n is not >0&x5,-ve,or not an int; printed
}


# prints statement if any elements in the list are >0 & %% of 5
#4.2

#example of else() and if() combo

numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else if(i < 5 & i %% 1 != 0){ 
    print(paste(i, ' is not an integer.', sep = ''))
  } else if(i >= 5 & i %% 1 == 0){
    print(paste(i, ' is not less than five.', sep = ''))
  } else {
    print(paste(i, ' is not less than five and is not an integer.', sep = ''))
  }
}

# 4.3

numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else if(i < 5 & i %% 1 != 0){
    print(paste(i, ' is not an integer.', sep = ''))
  } else if(i >= 5 & i %% 1 == 0){
    print(paste(i, ' is not less than five.', sep = ''))
  } else {
    print(paste(i, ' is not less than five and is not an integer.', sep = ''))
  }
}

# section 5

# example 1
x <- 0
while(x < 5){ # x starts from 0: 0, 1, 2, 3, 4, 5
  x <- x + 1
  print(paste('The number is now ', x, sep = ''))
} 

# example 2

x <- 1
while(x %% 5 != 0 | x %% 6 != 0 | x %% 7 != 0){
  x <- x + 1
}
print(paste('The lowest number that is a factor of 5, 6, 7 and 8 is ', x, sep = ''))


# Make your own loop that takes a starting value of x <- 0.999 
# that squares x in each loop until x is less than 0.5.

x <- 0.999 # x starts as value 0.999
while(x > 0.5){
  x<-x^2 # need to update the value of x inside the loop!
  print(x) 
} 

# Section 6.1: Basic Functions

# example of a function:

powers <- function(x){ # takes the value of x
  y <- x ^ 2 # x squared
  z <- x ^ 3 # x cubed
  return(c( y, z)) # list return outputs values of y and z)
}
powers(1)

# function that takes value x & calculates the square of the value (y) and the 
# cube of that value (z)

# Write a function that takes a character scalar (e.g. 'Bird')
# and returns a character scalar that appends is the word
# on the end of the word (e.g. ’Bird is the word').

# Did notreally understand this section
scalar <- function(x, y = "is the word"){
  paste(x,y)
}
scalar('bird','cat') 

# return and paste functions do the same thing

# Section 7: Question time 

#1) 

fib <- c(1,1,3,5,8,13,21)
for(i in fib){
  print(sqrt(i))
}

#2) & #3)

quote <- c('who','would','have','thunk','vectors') # vector containing quote
for(i in quote){
  if(nchar(i) < 4){
    print(paste(i,'is too short', sep=' '))}
  else if(nchar(i) > 6){
    print(paste(i,'is too long',sep=' '))
  }
  else(print(i))

garbled_film_quote <- (i) # saving all the printed outputs into a new vector
print(garbled_film_quote)
    }

#4) 

month_position <- function(x){
  match(x, months)
  # built in vector for months, start with capitals
  for(m in 1:length(months)){
    match(x, months)
  }
}
month_position('April')








