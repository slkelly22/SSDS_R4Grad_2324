#R for Graduate Students, 2023-24
#Week 3
#S.Kelly


library(tidyverse)

squirrels_data <- read.csv("~/Desktop/Abbrev_Central_Park_Squirrels_2018.csv")

?count
#follow up on a question from Week 2 about whether you can count more than one variable at a time; answer: yes
squirrels_data %>%
  count(shift, age) 