library(dplyr)
library(dslabs)
#mutate(murders,rate = total/population*100000,rank=rank(-rate)) %>% select(state,rate,rank)

data(murders)
mystate <- murders %>% mutate(rate=total/population*100000,rank=rank(-rate)) %>% filter(states %in% c('Northeast','West') & rate > 1) %>% select(state,rate,rank) 
print(mystate)

x <- murders$population
y <- murders$total
plot(x,y)

murders <- mutate(murders,rate=total/population*100000,rank=rank(-rate))
print(murders)
hist(murders$total)
hist(murders$rate)
boxplot(rate ~ region,data=murders)



