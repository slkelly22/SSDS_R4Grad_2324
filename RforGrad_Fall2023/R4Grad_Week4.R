#R4Grad Week 4 Syntax - Plotting with ggplot2

#loading the necessary libraries
library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins) 
data(package = "palmerpenguins")

search()

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

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point(color = "blue")

#what happens if you use a continuous variable for the color mapping? 
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = bill_length_mm)) + geom_point()

#let's create a plot -- does species or sex relate more strongly to bill length/depth?
#color sex
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = sex)) + geom_point() 

#color species
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species)) + geom_point() + facet_wrap(~species)

#differentiating with shapes 
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species)) + geom_point() 

ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species)) + geom_point() + facet_wrap(~island)

#differentiating with shapes and color
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species, color = species)) + geom_point() 

#you can mixed shape and color to different categorical variables but too many elements can confuse the viewer
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species, color = island)) + geom_point() 

#adding size
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species, color = species)) + geom_point(size = 4) 
ggsave("Savannahs_Plot.png")
?ggsave

#final plot
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm, shape = species, color = species)) + geom_point(size = 4) + labs(x = "Bill Length (mm)", y = "Bill Depth (mm)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica", subtitle = "Relationship between Bill Length, Bill Depth, and Species")
#saving the plot
ggsave("FinalPenguinPlot.png")

#Extra: ggeasy
install.packages("ggeasy")
library(ggeasy)

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + labs(x = "Flipper Length (mm)", y = "Body Mass (g)", title = "Antarctic Adult Penguins", caption = "Palmer Station, Antartica") + easy_center_title()

#Extra: shape by number
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm)) + geom_point(shape = 8) 