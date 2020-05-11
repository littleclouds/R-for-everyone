#if else are basic conditional checks 
a <- 1
if(a != 0){
  print(1/a)
}else{
  print('no reciprocal for 0.')
}

library(dslabs)
data("murders")
murder_rate <- murders$total/murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind])
}else{
  print('no state')
}

if(murder_rate[ind] < 0.25){
  print(murders$state[ind])
}else{
  print('no state')
}

#ifelse take(condition,expression for truth and expression for false)
a <- c(0,1,2,-4,5)
result <- ifelse(a>0 , 1/a , NA)
print(result)

#is.na() tells about NA in that column
data("na_example")
sum(is.na(na_example))
no_nas <- ifelse(is.na(na_example),0,na_example)
sum(is.na(no_nas))

#any is use to check if there is any true in variable
z <- c(TRUE,FALSE,TRUE)
any(z)
#all is use to check if all the entries are false
all(z)
