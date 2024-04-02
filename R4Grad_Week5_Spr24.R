# R4Grad Week 5 Syntax 
# Spring 2024 
# ggplot continued - Histograms and Density Plots

library(tidyverse)
library(gapminder) 
library(palmerpenguins)

search()

View(penguins)
#Returning back to scatterplots

#here we are plotting the penguin data from last week, with species represented by color
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point()

#what if we want to add a regression line? 
?geom_smooth
args(geom_smooth)
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point() + geom_smooth(method = "lm")
#you can turn off the standard errors with se = FALSE
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point() + geom_smooth(method = "lm", se = FALSE)
#why are we getting three different lines? Because what you identify in the aes() is passed down to the geoms that follow, but if you only want species to be represented in the point color but not in the lines, then move the color mapping out of the aes and into the geom_point()

# No color
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm")

# No color or SE
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm", se = FALSE)

#Global mapping
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point() + geom_smooth(method = "lm")

#Local mapping
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point(mapping = aes(color = species)) + geom_smooth(method = "lm")

#switching datasets
library(gapminder)
View(gapminder)
dim(gapminder)
?gapminder

#this is gdp(logged) plotted with life expectancy with the continents represented in color
ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent)) + geom_point()

gapminder %>%
  filter(year == 2007) %>%
  filter(continent == "Asia") %>%
  ggplot(mapping = aes(x = log(gdpPercap),y = lifeExp, color = country)) + geom_point(size = 3)


# Class Exercise
gapminder %>%
  filter(continent == "Africa") %>%
  filter(year == 2007) %>%
  ggplot(mapping = aes(x = log(gdpPercap),y = lifeExp, color = country, size = pop)) + geom_point()


#Histograms
#a basic histogram
ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram()

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white") 

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue")

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", bins = 40)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", binwidth = 10)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "violetred", binwidth = 10) + facet_wrap(~continent)

#color and fill
#Picking a color: R has 657 built-in named colours, which can be listed with colours().
colours()
colors()

#geom_density
#basic density
ggplot(gapminder, mapping = aes(x = lifeExp)) + geom_density()
#density with color aes
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent)) + geom_density()
#density with color and fill aes
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent)) + geom_density()
#density with color and fill and alpha
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent)) + geom_density(alpha = .3)

#alpha mapped to continent
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent, alpha = continent)) + geom_density()


#mapping to a variable needs an aes() -- globally or locally -- whereas mapping to a constant that is external to your dataset (color = "blue", alpha = .7) doesn't need aes()

library(ggeasy)
#let's make this look nicer
#ggeasy allows us to remove the legends we don't want

ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent)) + geom_density(alpha = 0.2) + labs(y = NULL, x = "Life Expectancy", fill = "Continent", title = "Worldwide Life Expectancy (1952 - 2007)", subtitle = "Gapminder Data") 

library(ggeasy)
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent)) + geom_density(alpha = 0.4) + labs(y = NULL, x = "Life Expectancy", fill = "Continent", title = "Worldwide Life Expectancy (1952 - 2007)", subtitle = "Gapminder Data") + easy_remove_legend(alpha, color) + theme_minimal()

#then ggsave() if you want



