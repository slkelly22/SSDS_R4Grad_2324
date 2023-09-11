#R for Graduate Students, 2023-24
#Week 1
#S.Kelly

#Understanding Packages
#shows your downloaded packages
library()

#how to download a package, put package name in parentheses; alternatively, use Packages - Install button
install.packages("tidyverse")

#shows you active (loaded) packages
search()

#loads the tidyverse package so you can use it
library(tidyverse)
#note: you can't load/activate a package that you haven't installed. 
#You only need to install a package one, but you need to load a package every time you want to use the package. 

#if you want help, you can use ? 
?tidyverse
?ggplot2

#let's also install readxl
install.packages("readxl")
library(readxl)
?readxl
?read.csv #What's this, and do we have access to it automatically? Hint: run search() again

#Reading in data
#with Base R
squirrels_data <- read.csv("~/Desktop/Abbrev_Central_Park_Squirrels_2018.csv")
#Alternative: reading in with readr and then grabbing code

View(squirrels_data)
nrow(squirrels_data)
ncol(squirrels_data)
dim(squirrels_data)
summary(squirrels_data)

head(squirrels_data)
tail(squirrels_data, 15)

summary(squirrels_data)

str(squirrels_data$date)

#you can always install packages as you work (although it's best to load everything in the beginning)
?lubridate
search()
library(lubridate)
search()
squirrels_data$date <- mdy(squirrels_data$date)
View(squirrels_data)

summary(squirrels_data)

#how do we change variable types
#what type of variable is running? 
str(squirrels_data$running)
#let's change that to numeric
squirrels_data$running <-as.numeric(squirrels_data$running)
summary(squirrels_data)

squirrels_data %>%
  count(running)
