library(dslabs)
library(tidyverse)

data(gapminder)
gapminder %>% 
  filter(year == 2015) %>% 
  select(country,infant_mortality) %>%
  summarise(mean(infant_mortality, na.rm = TRUE))

gapminder %>%
  filter(year == 2015) %>%
  ggplot(aes(fertility,life_expectancy))+
  geom_point(color = 'red')

gapminder %>%
  filter(year == 2015) %>%
  ggplot(aes(fertility,life_expectancy, color = continent))+
  geom_point()

#Faceting
#to compare two plots
#added as a layer facet_grid(), for two variable, 
#use a dot for comparing in one variable

gapminder %>% filter(year %in% c(1962,2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point()+
  facet_grid(continent ~ year)

gapminder %>% filter(year %in% c(1962,2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point()+
  facet_grid(~ year)

#facet by year, plot wrapped onto multiple rolls
#use facet_wrap()

years <- c(1960,1970,1980,1990,2000,2012)
continents <- c('Europe','Asia')

gapminder %>% filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point()+
  facet_grid(~ year)

#time series plots have time on x-axis and variable of interest on the y-axis
#geom_line() connects the data poiint and make a curve
#to plot multiple lines on the same graph, use group or color so that

gapminder %>%
  filter(country == 'United States') %>%
  ggplot(aes(year, fertility))+
  geom_point()
gapminder %>%
  filter(country == 'United States') %>%
  ggplot(aes(year, fertility))+
  geom_line()

countries <- c('South Korea','Germany')
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility))+
  geom_line()
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group = country))+
  geom_line()
#use col to add color
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country))+
  geom_line()
#adding text label
labels <- data.frame(country = countries, x = c(1975,1965), y = c(7,2))
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country))+
  geom_line()+
  geom_text(data = labels, aes(x,y, label =country),size = 5)+
  theme(legend.position = 'none')

countries <- c('India','China')
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country))+
  geom_line()

#Transformation
#can be use to better understand distribution
#log transformation :- 
#transforming the data before plotting or transform the axes of the plot
#scale_x_continuous is used to use without pre transformation and get 
#non log values in the x-axis

library(dslabs)
library(tidyverse)
ds_theme_set()
library(ggthemes)
library(gridExtra)
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970
gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color = 'red')
#log base 2 transform
g0 <- gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day)))+
  geom_histogram(binwidth = 1, color = 'yellow')+
  theme_economist()
#log base 2 transform in x axis 
g1 <- gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color = 'pink')+
  scale_x_continuous(trans = 'log2')+
  theme_economist()
grid.arrange(g0,g1,ncol = 2)


#stratify and boxplot
#number of region 
length(levels(gapminder$region))

#boxplot
past_year= 1970
p <- gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region,dollars_per_day))+
  geom_boxplot()
#to fit the labels in the x axis in better way
#element_text()
p + geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#reorder function is used to order the factor in some meaning full way
fac <- factor(c('Asia','Asia','West','West','West'))
levels(fac) #alphabetical
#reorder by the mean
value <- c(10,11,12,6,4)
fac <- reorder(fac,value, FUN = mean)
levels(fac) #gets orderred by the mean

p <- gapminder%>%
  filter(year == past_year & !is.na(gdp))%>%
  mutate(region = reorder(region,dollars_per_day,FUN = median))%>%
  ggplot(aes(region,dollars_per_day, fill = continent))+
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab(' ')
p


#comparing Distribution
#use intersect() to find the overlap between vectors

#histogram of income in West versus developing world 1970-2010

gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)
past_year <- 1970
west <- c('Western Europe','Northern Europe','Southern Europe','Northern America','Australia and New Zealand')
gapminder %>%
  filter(year == past_year& !is.na(gdp))%>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1,color = 'black')+
  scale_x_continuous(trans = 'log2')+
  facet_grid(. ~group)

present_year <- 2010
west <- c('Western Europe','Northern Europe','Southern Europe','Northern America','Australia and New Zealand')
gapminder %>%
  filter(year == c(past_year,present_year) & !is.na(gdp))%>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1,color = 'black')+
  scale_x_continuous(trans = 'log2')+
  facet_grid(year ~group)

#income distribution of west vs devloping only countries with data
#to check which has the data
g <- c(1,2,3,4,5,6)
h <- c(4,5,6,7,8,9)
intersect(g,h) #will find common values between g and h

country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1,country_list_2)
country_list

#make histogram including only countries with availble data
gapminder %>%
  filter(year == c(past_year,present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1,color = 'black')+
  scale_x_continuous(trans = 'log2')+
  facet_grid(year ~group)

#boxplots of income in west versus developing
p <- gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list) %>%
  mutate(region = reorder(region,dollars_per_day,FUN = median)) %>%
  ggplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab('')+ scale_y_continuous(trans = 'log2')
p + geom_boxplot(aes(x = region,y = dollars_per_day, fill = factor(year)))+
  facet_grid(year ~ .)
p + geom_boxplot(aes(x = region,y = dollars_per_day, fill = continent))+
  facet_grid(year ~ .)

#density plots
# in order to get smooth density plots which shows the movemen of countries to rich side
#with respect to time
#we can change the y-axis from density to count by ..count..

#smooth density plots- area under each curve adds to 1
past_year <- 1970
present_year <- 2010
west <- c('Western Europe','Northern Europe','Southern Europe','Northern America','Australia and New Zealand')

gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)

country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1,country_list_2)

#to get no. of elements in the group
gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  group_by(group)%>%
  summarise(n = n()) %>% knitr::kable()

gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  group_by(group)%>%
  summarise(n = n()) %>% knitr::kable()

p <- gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, 'West','Developing'))%>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = group))+
  scale_x_continuous(trans = 'log2')

p+ geom_density(alpha = 0.2, bw = 0.75)
p+ geom_density(alpha = 0.2, bw = 0.75)+ facet_grid(year ~ .)


#the case_when() function defines a factor whose levels are defined by a variety of logical
#operations to group data
#plot stacked density plots using position = stack
#add group as a factor, grouping regions
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ 'West',
    .$region %in% c('Eastern Asia','South-Eastern Asia') ~ 'East Asia',
    .$region %in% c('Caribbean','Central America','South America') ~ 'Latin America',
    .$continent == 'Africa' & .$region != 'Northern Africa' ~ 'Sub-Saharan Africa',
    TRUE ~ 'Others'
  ))
#reorder factor levels
gapminder <- gapminder %>%
  mutate(group = 
           factor(group,levels = c('East Asia','Latin America','Sub-Saharan Africa','Others')))
#stacked density plots

p1 <- gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list) %>%
  ggplot(aes(dollars_per_day,y = ..count.., fill = group))+
  scale_x_continuous(trans = 'log2')+ 
  geom_density(alpha = 0.2,bw = 0.75, position = 'stack') + facet_grid(year ~ .)

#weighted plots 
#with respect to the population of the countries
p2 <- gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list)%>%
  group_by(year)%>%
  mutate(weight = population/sum(population * 2)) %>%
  ungroup()%>%
  ggplot(aes(dollars_per_day,y = ..count.., fill = group, weight = weight))+
  scale_x_continuous(trans = 'log2')+
  geom_density(alpha = 0.2,bw = 0.75, position = 'stack') + facet_grid(year ~ .)+
  ggtitle('weighted w.r.t population')

library(gridExtra)
grid.arrange(p1,p2,ncol = 2)


#ecological fallacy 
#when we use average to reach a solution though there might be variation

#the logistic transformation is defined as f(p) = log(p/(1-p)) or the log of odds. 
#while p means probablity of happening 1-p is refered as probablity of not happening or odds
#the scale is useful for highlighting the differences near 0 and near 1
#and converts fold changes into constantincreases.
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ 'West',
    .$region %in% c('Eastern Asia','South-Eastern Asia') ~ 'East Asia',
    .$region %in% c('Caribbean','Central America','South America') ~ 'Latin America',
    .$continent == 'Africa' & .$region != 'Northern Africa' ~ 'Sub-Saharan Africa',
    .$region %in% 'Northern Africa' ~ 'Northern Africa',
    .$region %in% c('Melanesia' , 'Micronesia', 'Polynesia') ~ 'Pacific Islands'
    ))

#define dataframe with group avg income and avg infant survival rate
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group))%>%
  group_by(group)%>%
  summarise(income_per_day = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income
gapminder

#plotting infant survival versus income
surv_income %>% ggplot(aes(income_per_day, infant_survival_rate, label = group, color = group))+
  scale_x_continuous(trans = 'log2', limit = c(0.25,150))+
  scale_y_continuous(trans = 'logit', limit = c(0.875, .9981),
                     breaks = c(0.85,0.90,0.95,0.99,0.995,0.998))+
  geom_label(size = 3, show.legend = FALSE)
  
data(gapminder)

gapminder
surv_income
#to get the country specific data on infant survival versus income
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group))%>%
  group_by(country,continent)%>%
  summarise(income_per_day = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income %>% ggplot(aes(income_per_day, infant_survival_rate, label = country, color = continent))+
  scale_x_continuous(trans = 'log2', limit = c(0.25,150))+
  scale_y_continuous(trans = 'logit', limit = c(0.875, .9981),
                     breaks = c(0.85,0.90,0.95,0.99,0.995,0.998))+
  geom_point(size = 3, show.legend = TRUE)
