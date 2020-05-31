#SUMMARIZING THE DATA

#SUMMARIZE() from the dplyr/tidyverse package compute summary statistics from the data frame. 
#it returns a data frame whose column names are defined.

library(tidyverse)
library(dslabs)
data(heights)

#compute avg and sd
s <- heights %>% 
  filter(sex == 'Male') %>%
  summarize(avg = mean(height), sd = sd(height))
s

#access average and standard deviation from summary table
s$avg
s$sd

#compute median min and max
heights %>%
  filter(sex == 'Male')%>%
  summarize(median = median(height),
            minimum = min(height),
            maximum = max(height))

#alternate way to get min,median and max i.e 0%,50%,100%
quantile(heights$height, c(0,0.5,1))

heights %>%
  filter(sex == 'Male')%>%
  summarize(range = quantile(heights$height, c(0,0.5,1)))



#The Dot placeholder
#the dot allows you to access values stored in data that is being 
#piped using %>% character
#the dot operator allows dplyr function to return single vectors or 
#number instead of data frame
  
#us_murder_rate%>%.$rate is equvalent to us_murder_rate$rate or 
#use us_murder_rate%>%pull(rate)

library(tidyverse)
library(dslabs)
data(murders)

#claculate rate generates a data frame
us_murder_rate <- murders %>%
  summarise(rate = sum(total) / sum(population)*100000)
us_murder_rate
#to get numeric data use DOT Oerator
us_murder_rate %>% .$rate

#calculate and extract the murder rate with one pipe
us_murder_rate <- murders %>%
  summarise(rate = sum(total) / sum(population)*100000)%>% .$rate
us_murder_rate




#group by()
#the function from dplyr converts a data frame to a grouped dat frame, creating 
#groups using one or more variable

library(tidyverse)
library(dslabs)
data(heights)

#to compute separate average and standard deviation for male/female heights
heights %>%
  group_by(sex)%>%
  summarise(avg = mean(height), std = sd(height))

#compute median murder rate in 4 regions
data(murders)
murders <- murders %>%
  mutate(murder_rate = total/population * 100000)
murders %>% 
  group_by(region) %>%
  summarise(median_rate = median(murder_rate),mean_rate = mean(murder_rate))




#sorting the data tables
#arrange function sorts a dat frame by a give column
#default is ascending order
library(tidyverse)
library(dslabs)
data(murders)

#set up muders object
murders <- murder %>%
  mutate(murder_rate = total/population * 100000)

#arrange by murder rate
murders %>% arrange(murder_rate) %>% head()
murders %>% arrange(population) %>% head()
murders %>% arrange(region,murder_rate) #%>% head()
murders %>% arrange(desc(murder_rate)) %>% head()

#show the 10 top states
murders %>% arrange(desc(murder_rate)) %>% top_n(10)
