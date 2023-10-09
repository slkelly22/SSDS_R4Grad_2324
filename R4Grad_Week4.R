#R4Grad Week 4 Syntax - Plotting with ggplot2

#loading the necessary libraries
library(tidyverse)
install.packages("palmerpenguins", "ggeasy")
library(palmerpenguins) 
data(package = "palmerpenguins")
library(ggeasy)

#Let's take a look at the penguins dataset
View(penguins)

dim(penguins) #344, 8

glimpse(penguins)
summary(penguins)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()

ggplot(data = penguins) #blank

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) #axes present


ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() #now we have a visual plot

#let's add descriptions to the plot
?penguins

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + labs(x = "Flipper Length (mm)", y = "Body Mass (g)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica")

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + labs(x = "Flipper Length (mm)", y = "Body Mass (g)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica") + easy_center_title()
