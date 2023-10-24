#R4Grad Week 5 Syntax - Plotting with ggplot2 continued

library(tidyverse)
library(gapminder) 
library(palmerpenguins)

search()

View(penguins)
#Returning back to the scatterplots

#here we are plotting the penguin data from last week, with species represented by color
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point()

#what if we want to add a regression line? 
?geom_smooth
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point() + geom_smooth(method = "lm")
#you can turn off the standard errors with se = FALSE
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + geom_point() + geom_smooth(method = "lm", se = FALSE)
#why are we getting three different lines? Because what you identify in the aes() is passed down to the geoms that follow, but if you only want species to be represented in the point color but not in the lines, then move the color mapping out of the aes and into the geom_point()

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm")

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point() + geom_smooth(method = "lm", se = FALSE)

#here's how to retain the color mapping
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + geom_point(mapping = aes(color = species)) + geom_smooth(method = "lm", se = FALSE)


library(gapminder)
View(gapminder)
dim(gapminder)
?gapminder

ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent)) + geom_point()

gapminder %>%
  filter(year == 2007) %>%
  filter(continent == "Asia") %>%
  ggplot(mapping = aes(x = log(gdpPercap),y = lifeExp, color = country)) + geom_point(size = 3)

gapminder %>%
  filter(country == "Argentina") %>%
  ggplot(mapping = aes(x = lifeExp, y = year)) + geom_line()

#this is gdp(logged) plotted with life expectancy with the continents represented in color
ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent)) + geom_point()

#let's look at the same information but just within a single continent and year and mapping to size of the population
gapminder %>%
  filter(continent == "Africa") %>%
  filter(year == 2007) %>%
  ggplot(mapping = aes(x = log(gdpPercap),y = lifeExp, color = country, size = pop)) + geom_point()

gapminder %>%
  filter(year == 2007) %>%
  ggplot(mapping = aes(x = lifeExp)) + geom_histogram()

#Histograms
#a basic histogram
ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram()


ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white") 

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue")

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", bins = 40)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", binwidth = 10)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", binwidth = 10) + facet_wrap(~continent)


#geom_density
#basic density
ggplot(gapminder, mapping = aes(x = lifeExp)) + geom_density()
#density with color aes
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent)) + geom_density()
#density with color and fill aes
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent)) + geom_density()
#density with color and fill and alpha
ggplot(gapminder, mapping = aes(x = lifeExp, color = continent, fill = continent, alpha = .5)) + geom_density()

library(RColorBrewer)
?RColorBrewer

