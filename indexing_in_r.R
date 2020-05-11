#logical operator
#INDEX STORES THE INDEX POSITION OF THE LOGICAL OPERATOR

index <- murder_rate <= 0.71
print(index)

#sum is used to check no. of true in the 
sum(index)
murders$state[index]

#to check conditions
west <- murders$region == 'West'
safe <- murder_rate <= 1
index <- safe & west
murders$state[index]
print(index)


#INDEXING FUNCTUION
#WHICH
x <- c(FALSE,TRUE,FALSE,TRUE,FALSE)
which(x)
index <- which(murders$state == 'Washington')
murder_rate[index]

#match
index <- match(c('New York','Florida','Texas'),murders$state)
index
murder_rate[index]

#%in%
x <- c('e','a','d','c','b')
y <- c('e','c','b')
y %in% x

c('Boston','Washigton') %in% murders$state
