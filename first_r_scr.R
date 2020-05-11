install.packages('dslabs')  #install new packages
library(dslabs)             #call new packages
library(tidyverse)
data("murders")
data()
murders %>%
  ggplot(aes(population,total,label=abb,color=region)) + geom_label()
