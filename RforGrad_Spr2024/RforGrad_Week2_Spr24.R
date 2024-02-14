# R for Graduate Students, Spring 2914
# Week 2
# S.Kelly

# Remember to open up a new R script, and comment your code

# Last meeting we discussed how to install and load a package
# install.packages("tidyverse")
library(tidyverse)
search() #tells you which packages are loaded (turned on)

# How to get help
?function
?package

# R allows you to work with internal datasets, as well as load external datasets
# Let's import external data
# After using the "Import Dataset" drop-down button, copy and paste the syntax below
library(readr)
urban_park <- read_csv("RforGrad_Spr2024/Urban Park Ranger/Urban_Park_Ranger_Animal_Condition_Response_20240202.csv")
View(urban_park)
# Note function: read_csv("pathway")
# We'll also use: write_csv(object, "title.csv")


# Let's get familiar with our dataset
nrow(urban_park)
ncol(urban_park)
dim(urban_park)
head(urban_park)
head(urban_park, 10)
tail(urban_park, 10)

#Looking at the big picture
summary(urban_park) #Base R
glimpse(urban_park) #Tidyverse funciton

# Quick package to review descriptive statistics
install.packages("skimr")
skimr::skim(urban_park)

# Let's learn our first Tidyverse function from the dplyr package: count
# dataset %>%
   #  function(variable)

# What type of variable is Age in the dataset? 
str(urban_park$Age)

urban_park %>%
  count(Age)

urban_park %>%
  count(`Police Response`)

# Rename function
sk_urban_park <- urban_park %>%
  rename(police_response = 'Police Response')

View(sk_urban_park)          

sk_urban_park %>%
  count(police_response)

7 == 5|7

police_urban <- sk_urban_park %>%
  filter(police_response == TRUE)

dim(police_urban)

police_urban %>%
  count(Borough)

write_csv(police_urban, "police_urban.csv")
