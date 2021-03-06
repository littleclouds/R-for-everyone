#plots in ggplot2 consist of 3 component
#data
#geometry : type of plot
#Asthetic mapping: variables mapped to visual cues
#scale,labels,theme
library(tidyverse)
library(dslabs)
data(murders)

#to associate the ggplot to the dataset
ggplot(data = murders)
#will display a grey screen
murders %>% ggplot()
#to save ggplot into a variable
p<- ggplot(data = murders)
class(p)
print(p)

#layers
#in ggplot graphs are created by adding layer by layer
#data %>% ggplot() + layer1+.....layerN

murders %>% ggplot() + geom_point(aes(x = population/10^6 , y=total))

#add layer to predefined ggplot object
#things written inside aes() are used in mapping purpose
p <- ggplot(data =  murders)
p+geom_point(aes(x = population/10^6 , y=total))

#add text layer to scatter plot
p+geom_point(aes(x = population/10^6 , y=total))+
   geom_text(aes(population/10^6 ,total,label = abb))

#tinkering
#to change the size of the points
p+geom_point(aes(x = population/10^6 , y=total, size = 3))+
  geom_text(aes(population/10^6 ,total,label = abb))

#to nudge the labels
p+geom_point(aes(x = population/10^6 , y=total, size = 2))+
  geom_text(aes(population/10^6 ,total,label = abb),nudge_x = 1)

#simplify the code by adding global asthetic
p <- murders %>% ggplot(aes(population/10^6,total,label = abb))
p + geom_point(size = 3) +
  geom_text(nudge_x = 1.5)

#local aesthetic can overwrite global
p + geom_point(size = 3) +
  geom_text(aes(x = 10,y=800,label = 'hello'),nudge_x = 1.5)

#define p
library(tidyverse)
library(dslabs)
data("murders")
p <- murders %>% ggplot(aes(population/10^6 , total,label = abb))

#log base 10 scale the x axis and y axis
p + geom_point(size = 3)+
  geom_text(nudge_x = 0.05)+
  scale_x_continuous(trans = 'log10')+
  scale_y_continuous(trans = 'log10')

#efficient log scalling of the axes
p + geom_point(size = 3)+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()

#to add labels and title
p + geom_point(size = 3)+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()+
  xlab('population in mllion(log scale)')+
  ylab('total number of murder(log scale)')+
  ggtitle('US murder in 2010')

#change color of the points
#1.to make all points blue
p + geom_point(size = 3)+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()+
  xlab('population in mllion(log scale)')+
  ylab('total number of murder(log scale)')+
  ggtitle('US murder in 2010')+
  geom_point(size = 3,colour = 'blue')
#2. to make colour points by region
p + geom_point(size = 3)+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()+
  xlab('population in mllion(log scale)')+
  ylab('total number of murder(log scale)')+
  ggtitle('US murder in 2010')+
  geom_point(aes(col = region), size = 3)
#to do efficiently redefine p
p <- murders %>% ggplot(aes(population/10^6 , total, label = abb))+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()+
  xlab('population in mllion(log scale)')+
  ylab('total number of murder(log scale)')+
  ggtitle('US murder in 2010')

p+ geom_point(aes(col = region), size = 2)

#add the avg line in the scatter plot
#define the average
r <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)
help('pull')
#This works like [[ for local data frames, and automatically collects before 
#indexing for remote data tables.the default returns the last column (on the assumption 
#that's the column you've created most recently.
p + geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r)) #slope has default value of 1
#costmizing line to dashed and grey,line etc
p + geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r), lty = 2, color = 'black')

#change the legend
p + geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r), lty = 2, color = 'black')+ 
  scale_color_discrete(name = 'Regions')

#add ons
#themes
library(dslabs)
ds_theme_set() #default theme in dslab

#themes from ggthemes
install.packages('ggthemes')
library(ggthemes)
p + geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r), lty = 2, color = 'black')+ 
  scale_color_discrete(name = 'Regions')+ 
  theme_economist()

p + geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r), lty = 2, color = 'black')+ 
  scale_color_discrete(name = 'Regions')+
  theme_fivethirtyeight()

#ggrepel to stop labels from overlapping
install.packages("ggrepel")
#include it in place of nudge

#making a complete plot
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)

r <- murders %>% 
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)

murders %>% ggplot(aes(population/10^6 , total, label = abb))+
  geom_text(nudge_x = 0.05)+
  scale_x_log10()+
  scale_y_log10()+
  xlab('population in mllion(log scale)')+
  ylab('total number of murder(log scale)')+
  ggtitle('US murder in 2010')+
  geom_point(aes(col = region), size = 3)+
  geom_abline(intercept = log10(r), lty = 2, color = 'black')+
  theme_fivethirtyeight()

#geom_histogram
library(tidyverse)
library(dslabs)
data(heights)

p<- heights %>% 
  filter(sex == 'Male') %>%
  ggplot(aes(x = height,col = sex))

p + geom_histogram()
p + geom_histogram(binwidth = 1)
#colour
p + geom_histogram(binwidth = 1,fill = 'blue',col = 'black')+
  xlab('Male heights in inches')+
  ggtitle('histogram')

#smooth density plots
p + geom_density()
p + geom_density(fill = 'blue')

#for both the gender
p<- heights %>% 
  ggplot(aes(x = height,col = sex))

p + geom_histogram()
p + geom_histogram(binwidth = 1)

p + geom_density()
p + geom_density(data = heights)

#basic QQ-plot
p<- heights %>%
  filter(sex == 'Male') %>%
  ggplot(aes(sample = height))
p + geom_qq() #mean=0 sd =1
#qq-plot against a normal distribution with same mean/sd
params <- heights %>% 
  filter(sex=='Male')%>%
  summarize(mean = mean(height), sd = sd(height))
p + geom_qq(dparams = params)
#qq-plot against standard normal distribution
heights %>%
  ggplot(aes(sample = scale(height)))+
  geom_qq()+
  geom_abline()


#two add more graphs on a page
ds_theme_set()
library(ggthemes)
p0<- heights %>%
  filter(sex == 'Male') %>%
  ggplot(aes(x = height))
p1<- heights %>%
  filter(sex == 'Female') %>%
  ggplot(aes(x = height))
g1 <- p0 + geom_histogram(binwidth = 1,fill = 'Blue')+ 
  xlab('Male heights in inches')+
  ggtitle('histogram')+
  theme_foundation()
g2 <- p1 + geom_histogram(binwidth = 2,fill = 'Red')+ 
  xlab('Female heights in inches')+
  ggtitle('histogram')+
  theme_foundation()
g3 <- p0 + geom_density(fill = 'Blue')+ 
  xlab('Male heights in inches')+
  ggtitle('densityplot')+
  theme_foundation()
g4 <- p1 + geom_density(fill = 'Red')+ 
  xlab('Female heights in inches')+
  ggtitle('density')+
  theme_foundation()

install.packages('gridExtra')
library(gridExtra)
grid.arrange(g1,g2,g3,g4,ncol = 4)
grid.arrange(g1,g2,g3,g4,ncol = 2,nrow = 2)
