#sum of first n integers 
n <- 100
n*(n+1)/2
n <- 1000
n*(n+1)/2

x = seq(1,n)
sum(x)

log10(sqrt(100))
x <- 10
log(10^x)
log10(10^x)
log(exp(x))
exp(log(x,base = 2))


murders$state
murders$total
murders$abb
head(murders,n=50L)
str(murders)
?'head'
a <- murders$population
b <- murders[['population']]
identical(a,b)


city <- c('delhi','mumbai','kolkata')
temp <- c(25,40,35)
names(temp) <- city
print(temp)

temp[1:3]
temp[c(1,2)]
x <- 12:73
print(x)
length(x)

odd <- seq(1,100,2)
print(odd)
skip <- seq(6,55,4/7)
print(skip)
class(skip)
class(odd)

as.character(odd)
as.numeric(odd)

x <- c(1,2,3,'lkl')
as.character(x)
print(x)
as.numeric(x)


pop <- murders$population
sort(pop)
ord <- order(pop)
murders$state[ord]
state <- murders$state
sort(state)

max(pop)
min(pop)
imin <- which.min(pop)
murders$state[imin]

states <- murders$state
ra <- rank(murders$state)
my_df <- data.frame(name=states,id=ra)
print(my_df)
sort(my_df$name)


temp <- c(24,35,48,21,19)
city <- c('delhi','mumbai','kolkata','chennai','banglore')
city_temp <- data.frame(name=city,temprature=temp)
temp <- (temp*9/5)+32
print(temp)
print(city_temp)

x <- 1:100
print(x)
y =1/x^2
print(y)
sum(y)
pi^2/6

library(dslabs)
data(murders)
murder_rate=murders$total/murders$population*100000
mean(murder_rate)
low <- murder_rate < 1
print(low)

which(murder_rate < 1)
index <- which((murder_rate<1))
murders$state[index]  

reg <- murders$region == 'Northeast'
index <- reg&low
murders$state[index]
avg <- mean(murder_rate)
murder_rate < avg

abbs <- c('MA','ME','MI','MO','MU')
i<- which(!abbs%in%murders$abb)
print(i)
murders$abb[i]

library(dslabs)
data("murders")
library(dplyr)
murders <- mutate(murders,rate=total/population*100000)
rank <- rank(-murders$rate)
print(rank)
murders <- mutate(murders,rank)
print(murders)

select(murders,state,abb)

filter(murders,state == 'New York' )

murders <- mutate(murders,rate=total/population*100000,rank = rank(-rate))
filter(murders,rank <= 5)
no_florida <- filter(murders,state != 'Florida')
print(no_florida)

no_south <- filter(murders,region != 'South')
print(no_south)
nrow(no_south)

filter(murders,state %in% c('New York','Texas'))

murder_nw <- filter(murders,region %in% c('Northeast','West'))

nrow(murder_nw)
print(murder_nw)

myst <- filter(murders,region %in% c('Northeast','West') & rate < 1)
select(myst,state,rate,rank)

library(dplyr)
library(dslabs)
mutate(murders,rate = total/population*100000,rank=rank(-rate)) %>% select(state,rate,rank)

data(murders)
mystate <- murders %>% mutate(rate=total/population*100000,rank=rank(-rate)) %>% filter(states %in% c('Northeast','West') & rate > 1) %>% select(state,rate,rank) 
print(mystate)

library(dslabs)
data("murders")

milion_pop <- murders$population/10^6
tot <- murders$total
plot(milion_pop,tot)

log10m <- log10(milion_pop)
log10t <- log10(tot)
plot(log10m,log10t)

hist(milion_pop)
boxplot(population ~ region,data=murders)

x<- c(1,2,-3,4)
if(all(x>0)){
  print('all positive')
}else{
  print('not all positive ')
}

x<-c(FALSE,TRUE)
all(x)
any(x)
any(!x)
all(!x)

new_names <-ifelse(nchar(murders$abb)<8 , murders$abb,murders$state)
print(new_names)


sum_n <- function(n){
  x <- 1:n
  sum(x)
}
sum_n(5000)

altman_plot <- function(x,y){
  plot((y-x),x+y)
}
altman_plot(25,52)

log_plt <- function(x,y){
  plot(log10(x),log10(y))
}
log_plt(15,20)

m <-25
s_n <- vector(length = m)
for(n in 1:m){
  s_n[n] <- com(n)
}
n<-1:m
plot(n,s_n)

com <- function(n){
  x <- 1:n
  sum(x^2)
}
com(25)
