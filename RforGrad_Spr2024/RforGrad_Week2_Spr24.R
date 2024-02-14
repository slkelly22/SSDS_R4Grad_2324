# R for Graduate Students, Spring 2914
# Week 2
# S.Kelly

# Last meeting we discussed how to install and load a package
# install.packages("tidyverse)
library(tidyverse)
search() #tells you which packages are loaded (turned on)

# How to get help
?package
?function

# R allows you to work with internal datasets, as well as load external datasets
# Let's import external data
# After using the "Import Dataset" drop-down button, copy and paste the syntax below
library(readr)
urban_park <- read_csv("RforGrad_Spr2024/Urban Park Ranger/Urban_Park_Ranger_Animal_Condition_Response_20240202.csv")
View(urban_park)
# Note function: read_csv("pathway")
# We'll also use: write_csv(object, "title.csv")


#Let's get familiar with our dataset
nrow(urban_park)
ncol(urban_park)
dim(urban_park)
summary(urban_park) #Base R
glimpse(urban_park) #Tidyverse

#looking for missing data
is.na(urban_park)
sum(is.na(urban_park))
