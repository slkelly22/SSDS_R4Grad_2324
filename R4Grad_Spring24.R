# R for Graduate Students
# Day 1

# this is how you see where your directory is located
getwd()

number <- 3
number + 10

numbers <- c(5, 10, 12)
numbers + 10

numbers <- c("five", "ten", "twelve")
numbers + 10

numbers <- c(T, F, T)
numbers + 10

rm(number, numbers)

#Snakecase
fav_color

#camalcase
FavColor

happy_numbers <- c(23, 32, 45)
favorite_cats <- c("Bennie", "Apple", "Pancake")

kelly_happy <- data.frame(happy_numbers, favorite_cats)

kelly_happy

View(kelly_happy)

#how to install manually
install.packages("tidyverse")

library(tidyverse)

search()

#arguments within functions
counts <- c(2, 3, 4, 5, NA)
mean(counts)
mean(counts, na.rm = TRUE)
?mean

#to see version of R
R.Version()
