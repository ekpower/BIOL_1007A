##### Vectors, Matrices, Data Frames and Lists  
##### 17 January 2023  
##### EKP  


# Vectors (cont.)  

## Properties
### Coercion  
  ### All atomic vectors are of the same data type
   ### If you use c() to assemble different types, R coerces them
    ### **logical -> integer -> double -> character**
a <- c(2, 2.2)  # 2 is an integer, 2.2 is a double
print(a)        # coerces to double

b <- c("purple", "green")   # both character
typeof(b)

d <- c(a,b)
typeof(d)
  # elements of vector a (doubles) with elements of vector b (characters)
  # coerces to characters (" ")

### comparison operators yield a logical result
a <- runif(10)  # simulates 10 random uniform numbers
print(a)

a > 0.5  # tells you which numbers are greater than 0.5 (T/F)
  # conditional statement

### how many elements in the vector are > 0.5?
sum(a > 0.5)
  # sums number of elements greater than 0.5 (sums up TRUEs)
mean(a > 0.5)
  # what proportion of vector are greater than 0.5


## Vectorization
### add a constant to a vector

z <- c(10, 20, 30)
z + 1
  # adds 1 to each element of vector

### what happens when vectors are added together?
y <- c(1, 2, 3)
z + y  # results in an 'element by element' operation on the vector


## Recycling
### what if vector lengths are not equal?
z <- c(10, 20, 30)
x <- c(1, 2)
z + x  # recycles x (adds 1, then 2, then 1 again)
  # shorter vector is ALWAYS recycled


# Simulating data: runif and rnorm()

## runif
runif(5)  # gives you 5 random uniform numbers
runif(n=5, min=5, max=10)  # numbers are between 5 and 10
  # 'n' = sample size, 'min' = min value, 'max' = max value

set.seed(123)  # generates the same randomized numbers each time
  # set seed can be any number, sets random number generator and is reproducible
  # the number you input sets the specific randomized numbers
runif(n=5, min=5, max=10)
set.seed(376)
runif(n=5, min=5, max=10)
hist(runif(n=100, min=5, max=10))

## rnorm: random normal values with mean 0 and standard deviation 1
randomNormalNumbers <- rnorm(100)
mean(randomNormalNumbers)  # histogram function shows distribution

rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30))
