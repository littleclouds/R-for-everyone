library(tidyverse)
library(dslabs)
data("heights")
index <- heights$sex == 'Male'
x <-  heights$height[index]

avg <- mean(x)
std <- sd(x)
c(avg = avg,std = std)
#TO FIND STANDARDISED UNITS or Z-scores
z <- scale(x)
mean(abs(z) < 2)
abs(z)


x <- heights %>% filter(sex == 'Male') %>% pull(height)

#pull() works like [[ for local data frames,
#and automatically collects before indexing for remote data tables.
#A variable specified as:a literal variable name

#pnorm gives the value of the CDF F(a) for the normal distribution
pnorm(70.5,mean(x),sd(x)) #here it gives the probablity of data more than 70.5
1 - pnorm(70.5,mean(x),sd(x)) #this will give probablity for less than 70.5

#plot distribution of exact heights
plot(prop.table(table(x)),xlab = 's = height in inches' , ylab = 'pr(x=a)')


#DISCRETIZATION
#problities in actual dta over length 1 ranges containing an integer
mean(x <= 68.5) - mean(x <= 67.5)
mean(x <= 69.5) - mean(x <= 68.5)
mean(x <= 70.5) - mean(x <= 69.5)

#probablities in normal approximation matches well with the result above
pnorm(68.5,mean(x),sd(x)) - pnorm(67.5,mean(x),sd(x))
pnorm(69.5,mean(x),sd(x)) - pnorm(68.5,mean(x),sd(x))
pnorm(70.5,mean(x),sd(x)) - pnorm(69.5,mean(x),sd(x))

#probalities in actual data over other ranges dont match normal approx well
mean(x <= 70.9) - mean(x <= 70.1)
pnorm(70.9,mean(x),sd(x)) - pnorm(70.1,mean(x),sd(x))
