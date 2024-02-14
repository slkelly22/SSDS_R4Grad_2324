#R for Graduate Students, 2023-24
#Week 2
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
?select

#let's also install readxl
install.packages("readxl")
library(readxl)
?readxl

?read.csv #What's this, and do we have access to it automatically? Hint: run search() again

#Reading in data
#with Base R
squirrels_data <- read.csv("~/Desktop/Abbrev_Central_Park_Squirrels_2018.csv")

#Alternative: reading in with readr and then grabbing code
#note the subtle syntax difference between Base R (read.csv) and readr (read_csv)
library(readr)
Abbrev_Central_Park_Squirrels_2018 <- read_csv("Abbrev_Central_Park_Squirrels_2018.csv")
View(Abbrev_Central_Park_Squirrels_2018)


View(Abbrev_Central_Park_Squirrels_2018)

View(squirrels_data)
nrow(squirrels_data)
ncol(squirrels_data)
dim(squirrels_data)

head(squirrels_data, 2)
tail(squirrels_data, 15)

#base R
summary(squirrels_data)
#what's the structure of the date? 
str(squirrels_data$date)
class(squirrels_data$date)

#activity: what's the structure and class of tail flags? 
str(squirrels_data$tail_flags)
class(squirrels_data$tail_flags)

#First Tidy (dplyr) function: count
#when were more squirrels observed in this dataset? 
squirrels_data %>%
  count(shift)

#what ages are represented in the dataset?
squirrels_data %>%
  count(age)


#you can always install packages as you work (although it's best to load everything in the beginning)
#lubridate is part of the tidyverse ecosystem but it's not installed with main tidyverse package so you have to install it separately
install.packages("lubridate")
library(lubridate)
search()
View(squirrels_data)
class(squirrels_data$date)
squirrels_data$date <- mdy(squirrels_data$date)
View(squirrels_data)
class(squirrels_data$date)

summary(squirrels_data)

#how do we change variable types
#what type of variable is running? 
str(squirrels_data$running)
#let's change that to numeric
squirrels_data$running <-as.numeric(squirrels_data$running)
summary(squirrels_data)
View(squirrels_data)
squirrels_data %>%
  count(running)

class(squirrels_data$running)
squirrels_data$running <-as.logical(squirrels_data$running)
class(squirrels_data$running)
View(squirrels_data)

#how do we export this dataset (the one with the corrected date)
#1. What did you save it as? Same object or new? 
#Base R
write.csv(squirrels_data, "Squirrels_Data_with_Date.csv")
