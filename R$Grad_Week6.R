#R4Grad Week 6 Syntax - Plotting with ggplot2 continued

library(tidyverse)
library(gapminder) 
install.packages("socviz")
library(socviz)

search()
#----
#cover: 
geom_boxplot()
geom_bar() geom_col()
geom_line()
#Introduction to Quarto
-----

View(gapminder)

#Basic Line Graph
gapminder %>%
  filter(country == "Mexico") %>%
  ggplot(mapping = aes(x = year, y = lifeExp)) + geom_line(color = "steelblue4", size = 5)
colors()
#Task: Filter the dataset and create a line graph for Argentina and Bolivia; According to gapminder data, who has higher life expectancy? (use time as y axis)
gapminder %>%
  filter(country == "Argentina" | country == "Bolivia") %>%
  ggplot(mapping = aes(x = year, y = lifeExp, color = country)) + geom_line(linetype = "dotted", size = 3)

#let's do group_by() and summarize()

#what we currently have in the dataset are country gdps for particular years, but what if we wanted the average gdp for each continent?  And then to plot that across years? 
#group by, summarize, and arrange
gapminder %>%
  group_by(continent, year) %>%
  summarize(continent_gdp = mean(gdpPercap)) %>%
  arrange(year)

#explain the difference between mutate (which creates a new variable in the dataset) and summarize, which is collapsing data and then creating a variable

#group by, summarize, and plot a line graph
gapminder %>%
  group_by(continent, year) %>%
  summarize(continent_gdp = mean(gdpPercap)) %>%
  ggplot(mapping = aes(x = year, y = continent_gdp, color = continent)) + geom_line(size = 2)

#Boxplot
#categorical and continuous variable
install.packages("socviz")
library(socviz)
data(package = "socviz")
View(county_data)
dim(county_data)
county_data$hh_income  

county_data %>%
  group_by(state) %>%
  ggplot(mapping = aes(x = state, y = hh_income)) + geom_boxplot()

county_data %>%
  group_by(state) %>%
  ggplot(mapping = aes(x = state, y = hh_income)) + geom_boxplot() + coord_flip()

county_data %>%
  group_by(state) %>%
  ggplot(mapping = aes(x = reorder(state, hh_income), y = hh_income)) + geom_boxplot() + coord_flip()

#Geom_Bar with Geom_Col