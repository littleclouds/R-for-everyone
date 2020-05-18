install.packages('HistData')
library(HistData)
data(Galton)
x <- Galton$child
mean(x)
median(x)
mad(x) #medain around deviation
sd(x)
#mean and median , mad and sd are simillar this happens 
#when data follows normal approximation

#if ther is mistake in some value of data it can be updated through this
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10

mean(x_with_error) -  mean(x)
sd(x_with_error) -  sd(x)
median(x_with_error) -  median(x)
mad(x_with_error) -  mad(x)

#we see after change in data or mistake mean and sd changes but 
#median and mad remain same

x <- Galton$child
error_avg <- function(k){
  x[1] <- k
  mean(x)
}

error_avg(10000)
error_avg(-10000)
