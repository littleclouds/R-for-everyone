library(dslabs)
data("murders")

#to see the data type of the variable
class(murders)
#to see the structure of data frame
str(murders)
#to show the first 6 lines in the dataframe
head(murders)
#to see deisred no. of values
head(murders,n=50)
#$ is an accessor operator used to access the data under the column in the dataframe
#the output is called as vectors
murders$population
#length shows length of the column of the dataframe
pop <- murders$population
length(pop)

class(pop)
class(murders$state)

z <- 3 == 2
class(z)
class(murders$region)

a <- murders$population
#to call various column in a dta frame
b <- murders[['population']]
#to check if to varible are of same class
identical(a,b)

#no. of levels in a factor data type column
nlevels(movielens$genres)
#counts the repeatation of element in a vector or variable
x <- c('a','a','b','b','c')
table(x)
