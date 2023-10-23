#R4Grad Week 5 Syntax - Plotting with ggplot2 continued

library(tidyverse, gapminder, palmerpenguins)

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
  filter(continent == "Europe") %>%
  filter(year == 2007) %>%
  ggplot(mapping = aes(x = log(gdpPercap),y = lifeExp, color = country, size = pop)) + geom_point()

gapminder %>%
  filter(year == 2007) %>%
  ggplot(mapping = aes(x = lifeExp)) + geom_histogram()


________
#introducing the gapminder data
library(gapminder)

View(gapminder)

ggplot(gapminder, mapping = aes(x = log(gdpPercap),y = lifeExp)) + geom_point()

ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent)) + geom_point() + labs(x = "GDP per Capita", y = "Life Expectancy", title = "Gapminder Data", caption = "Data 2017") + facet_wrap(~continent)

#shape
ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent)) + geom_point(shape = 17) + labs(x = "GDP Per Capita", y = "Life Expectancy", color = "Continent")

ggplot(gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent, shape = continent)) + geom_point() + labs(x = "GDP Per Capita", y = "Life Expectancy", color = "Continent")

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram()

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white") 

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue")

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", bins = 40)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", binwidth = 10)

ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_histogram(color = "white", fill = "blue", binwidth = 10) + facet_wrap(~continent)

#line graph
gapminder %>%
  filter(continent == "Asia") %>%
  ggplot(gapminder, mapping = aes(x = year, y = lifeExp, color = country)) + geom_line()
#code does the same thing as above
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = country)) + geom_line(data = filter(gapminder, continent == "Asia"))

#hands-on activity
gapminder %>%
  filter(continent == "Americas") %>%
  ggplot(gapminder, mapping = aes(x = year, y = lifeExp, color = country)) + geom_line() + labs(x = "Year", y = "Life Expectancy", title = "Life Expectancy in the Americas", color = "Country", caption = "Gapminder Data")

#boxplot
library(openintro)
View(run17)
?run17

#basic boxplot

#now with a mutated variable

ggplot(run17, mapping = aes(x = event, y = clock_sec)) + geom_boxplot(fill = "maroon") + labs(x = "Race Event", y = "Finish Time (in seconds)", title = "Cherry Blossom Run, 2017")

run17 %>%
  mutate(clock_min = clock_sec/60) %>%
  ggplot(run17, mapping = aes(x = event, y = clock_min)) + geom_boxplot(fill = "maroon") + labs(x = "Race Event", y = "Finish Time (in minutes)", title = "Cherry Blossom Run, 2017")

gapminder %>%
  filter(continent == "Africa") %>%
  ggplot(gapminder, mapping = aes(x = country, y = lifeExp)) + geom_boxplot(fill = "orange") + coord_flip()

?geom_density
ggplot(data = gapminder, mapping = aes(x = lifeExp)) + geom_density() + facet_wrap(~continent)


library(RColorBrewer)
?RColorBrewer

gapminder %>%
  filter(continent == "Asia") %>%
  ggplot(gapminder, mapping = aes(x = year, y = lifeExp, color = country)) + geom_line(linetype = 'dashed') + scale_color_brewer(palette = "Paired")
