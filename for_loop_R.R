compute_sum <- function(n){
  x <- 1:n
  sum(x)
}

#simple for loop
for(i in 1:5){
  print(i)
}
print(i) #i will store only the final value after loop

m<-100
s_n <- vector(length = m) #creating empty vector
for(n in 1:m){
  s_n[n] <- compute_sum(n)
}
print(s_n) #to hold all values

n<- 1:m
plot(n,s_n)
lines(n,n*(n+1)/2)

for (i in 1:15) {
  if(i>10){
    print(i)
  }else{
    print('hello')
  }
}

