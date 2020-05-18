library(dslabs)
data("heights")

#summary() gives you min,max,mean,quartiles
summary(heights$height)

#percentiles are quartiles which divide the data set into 100 intervals each with 1% probablity
p <- seq(0.01,0.99,0.01) #printing 1% to 99% with gap of 1%, this is use to divide the data set into desired intervals
percentiles <- quantile(heights$height,p)

percentiles[names(percentiles == 25)] #to get quartiles, we find 25th percentile , 50th and 75th

percentiles[names(percentiles == 75)]

print(percentiles)

#theoretical percentile are calculated in order to verify whether sample follows normal distribution or not
p <- seq(0.01,0.99,0.01)
theoretical_quantiles <- qnorm(p,69,3)  #qnorm give theoretical value of a quantile with proablity p 
#.69=mean 3=standard deviation
print(theoretical_quantiles)


#in qq plot, the sample quantiles in the observed data are compared to theoretical. 
#if the data are well approximated by normal distribution , then the points on qqplot fall near the identity line
#(observed = theoretiacl)

library(tidyverse)
library(dslabs)
data("heights")
index <- heights$sex == 'Male'
x <- heights$height[index]
z <- scale(x)

#propotion of data below 69.5
mean(x <= 69.5)

#calculate observed and theoretical quantiles
p <- seq(0.05,0.95,0.05)
observed_quantiles <-quantile(x,p)
theoretical_quantiles <- qnorm(p,mean = mean(x),sd = sd(x))

#make qq plot
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)

#make qqplot with scaled value/standardised units/z-scores
observed_quantiles <- quantile(z,p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)


#for female
index <- heights$sex == 'Female'
x <- heights$height[index]
z <- scale(x)

#propotion of data below 69.5
mean(x <= 69.5)

#calculate observed and theoretical quantiles
p <- seq(0.05,0.95,0.05)
observed_quantiles <-quantile(x,p)
theoretical_quantiles <- qnorm(p,mean = mean(x),sd = sd(x))

#make qq plot
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)

#make qqplot with scaled value/standardised units/z-scores
observed_quantiles <- quantile(z,p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)
