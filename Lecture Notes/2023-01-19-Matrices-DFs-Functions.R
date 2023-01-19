###### Finishing up Matrices and Data Frames
###### 19 January 2023
###### EKP

m <- matrix(data = 1:12, nrow = 3)

## subsetting based on elements
m[1:2, ]
m[, 2:4]

## subset with logical (conditional) statements
## select all columns for which the totals are greater than 15
colSums(m) > 15
m[, colSums(m) > 15]  # subsets based on conditions (sum of column > 15)

## row sums 
## select rows that sum up to 22
m[rowSums(m)==22,]
m[rowSums(m)!=22,]

## LOGICAL OPERATORS:
  ## == equals
  ## != does not equal
  ## > greater than 
  ## < less than 

## subsetting to a vector changes the data type
z <- m[1, ]
print(z)
str(z)

z2 <- m[1, , drop=FALSE]  # argument maintains the matrix identity

## simulate new matrix
m2 <- matrix(data = runif(9), nrow=3)
m2[3,2]

## use assignment operator to substitute values
m2[m2 > 0.6] <- NA  # makes any value >0.6 an NA

data <- iris
head(data)
tail(data)

data[3,2]  # numbered indices work, but sometimes it's better to use names
dataSub <- data[,c("Species", "Petal.Length")]
str(dataSub)

## sort a data frame by values
orderedIris <- iris[order(iris$Petal.Length),]
