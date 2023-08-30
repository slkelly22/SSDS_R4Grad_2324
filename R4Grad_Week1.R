#R for Graduate Students, 2023-24
#Week 1
#S.Kelly

#getting oriented, setting preferences, understanding panels
#setting up your directory
getwd()
setwd()
#always know where you are in your files; saving your files vs. saving your workspace
#what is a project in R?

#getting to know Base R
#R is case sensitive
#most of the mistakes you'll make in R are spelling errors [or not loading libraries]
#tearatings is not the same as Tearatings

#What is Tidy Data? 

#the assignment operator & data types in R
fav_number <- 10
fav_numbers <- c(10, 5, 17)
str(fav_numbers)
mean(fav_numbers)

#be careful of overwriting your objects! 
fav_number <- "ten"
#categorical data
my_fav_colors <- c("olive green", "mustard yellow", "dark grey")
print(my_fav_colors)
str(my_fav_colors)
mean(my_fav_colors) #why doesn't that work? 

#logical
liked_movie <- c(TRUE, FALSE, TRUE)
str(liked_movie)
mean(liked_movie)

#naming conventions
01var <- c(3, 2, 3, 4, 7) #that doesn't work
var01 <- c(3, 2, 3, 4, 7) #that works
#var name is too too non-descript, what would be better? 
tea_ratings <- c(3, 2, 3, 4, 7)
#you can take an assignment and do things with it
mean(tea_ratings)
tea_ratings *5

#logical comparisons
tea_ratings <= 3 #returns a logical vector
tea_ratings !=3

#you can remove objects from your environment
rm(var01)
#Be careful: you can easily write over objects and entire dataframes if you use the same name

#creating a basic dataset with Base R
#assignment operator is <-

tea_ratings <- c(3, 2, 3, 4, 7)
tea_type <- c("oolong", "black", "green", "white", "herbal")
steep_time <- c(3.5, 4, 3, 4.5, 5)

#note: have to have the same number of rows to combine like this
tea_dataset <- data.frame(tea_type, steep_time, tea_ratings)
View(tea_dataset)
str(tea_dataset)

#Understanding Packages
#shows your downloaded packages
library()

#how to download a package, put package name in parentheses; alternatively, use Packages - Install button
intall.packages("tidyverse")

#shows you active (loaded) packages
search()

#loads the tidyverse package so you can use it
library(tidyverse)
#note: you can't load/activate a package that you haven't installed. 
#You only need to install a package one, but you need to load a package every time you want to use the package. 

#if you want help, you can use ? 
?mean

#reading in data
SK_geology_7.10.23 <- read.csv("~/Desktop/SK_geology_7.10.23.csv")
