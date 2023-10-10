#R4Grad Week 4 Syntax - Plotting with ggplot2

#loading the necessary libraries
library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins) 
data(package = "palmerpenguins")


#Let's take a look at the penguins dataset
View(penguins)

dim(penguins) #344, 8

glimpse(penguins)
summary(penguins)

ggplot(data = penguins) #blank

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) #axes present


ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() #now we have a visual plot

#let's add descriptions to the plot
?penguins

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + labs(x = "Flipper Length (mm)", y = "Body Mass (g)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica")

#let's see if the relationship varies by penguin species by mapping color
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point()
#ggsave("penguins_color_nolabs.png")

#what happens if you use a continuous variable for the color mapping? 
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = bill_length_mm)) + geom_point()
#ggsave("penguins_gradient_color_nolabs.png")

#let's create a plot -- does species or sex relate more strongly to bill length/depth?
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = sex)) + geom_point() 
ggsave("penguin_bill_sex.png")
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species)) + geom_point() 
ggsave("penguin_bill_species.png")

#let's save our plot

install.packages("ggeasy")
library(ggeasy)

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + labs(x = "Flipper Length (mm)", y = "Body Mass (g)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica") + easy_center_title()

