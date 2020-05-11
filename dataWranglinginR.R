library(dplyr)

#data wrangling

#mutate
murder <- mutate(murders,rate=total/population*100000)
print(murder)

#filter
filter(murder,rate <= 0.71)

#select
new <- select(murder,state,region,rate)
print(new)

#pipe line operation
# %>%
murder %>% select(state,region,rate) %>% filter(rate <= 0.71)
