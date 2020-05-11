library(dslabs)
data("murders")
death <- murders$total
x <- c(21,5,4,6,89,12,21)
#to arrange the data in increasing order
sort(murders$total)
sort(x)

#to get the index oof sorted result
inex <- order(death)
death[inex]
order(death)
index <- order(x)
x[index]
order(x)
#shows which state has maximum killing
murders$state
murders$abb
index <- order(murders$total)
murders$abb[index]
#max shows the max value in that coulmn
max(murders$total)
#which max shows the cindex at max is present
i_max <- which.max(murders$total)
#shows state at the max index
murders$state[i_max]

#to get the index in which data will be stored
rank(x)
x <- c(88,100,83,92,94)
#high to low
rank(x)
#low to high
rank(-x)
