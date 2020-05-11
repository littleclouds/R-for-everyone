#creates vectors
code <- c(380,124,818)
cod <- c('italy','spain','germany')
codes <- c(italy=380,spain=124,germany=818)

#to merge to vectors
names(code) <- cod
print(code)

#to get the desried value
codes[2]
#to get selected data
code[c(1,3)]
#to get the range of data
code[1:3]
#to get the data under the vector
code['germany']
codes[c('spain','germany')]


#coercion is property to self convert or change the datatype of object
x <-c(1,'canada',3)  #all are converted into string
print(x)
x[1]
x[1:3]

#to convert character into string and vice versa
as.character(code)
as.numeric(code)
           


#vector arithmetic
a <- c(1,2,3,4,5,6)
print(a*2)
print(a+2)
print(a-2)
b <- c(7,8,9,6,4,5)
print(a+b)
print(a*b)

murders$state[which.max(murders$population)]
murders$state[which.max(murders$total)]
max(murders$population)

murder_rate = murders$total/murders$population*100000
print(murder_rate)
max(murder_rate)
murders$state[order(murder_rate)]
max(murder_rate)
sort(murder_rate)
order(murder_rate)
rank(murder_rate)


x <- c(2,43,27,96,18)
sort(x)
order(x)
rank(x)
min(x)
which.min(x)
max(x)
which.max(x)

name <- c('m','a','n','o')
distance <- c(0.8,3.1,2.8,4.0)
time <- c(10,30,40,50)
ti <- time/60

speed <- distance/ti
print(speed)
