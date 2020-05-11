library(dslabs)
data("heights")


#to see names of variable in the data set
names(heights)
class(heights$sex)
print(heights$sex)


#to check unique values in the variable
x <- c(3,3,3,3,4,4,2)
a <- unique(x)
length(a)
b <- unique(heights$height)
length(b)


#to compute the frequency of each unique value in a categorical value
table(x)
table(heights$sex)
tab <- table(heights$height)
sum(tab == 1)
sum(c)
#to see the propotionl frequency
prop.table(table(heights$sex))


#cumulative distribution function
#As defined , plot of the CDF for male heights values a on the x axis 
#and the propotion of students with heights of that value or lower F(a) on the y axis
a <- seq(min(heights$height),max(heights$height),length = 100) #sets the range of height
cdf_func <- function(x){  #function to comute pr(x <= a)
  mean(heights$height <= x)
}
cdf_val <- sapply(a,cdf_func)  
#lapply returns a list of the same length as X, 
#each element of which is the result of applying FUN to the corresponding element of X.
#sapply is a user-friendly version and wrapper of lapply by default returning a vector, 
#matrix or, if simplify = "array", an array if appropriate, by applying simplify2array(). sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f).
plot(a,cdf_val)
hist(a)
hist(heights$height)
help('sapply')
