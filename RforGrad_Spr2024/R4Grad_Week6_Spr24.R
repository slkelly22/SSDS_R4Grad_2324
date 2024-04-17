#R4Grad Week 6 Syntax - Plotting with ggplot2 continued

library(tidyverse)
library(gapminder) 
#install.packages("usdata")
library(usdata)

search() #to confirm packages are loaded

#cover for Week 6: 
#geom_boxplot()
#geom_bar() geom_col()
#geom_line()

# Look at gapminder data
View(gapminder)

#Basic Line Graph
gapminder %>%
  filter(country == "Mexico") %>%
  ggplot(mapping = aes(x = year, y = lifeExp)) + geom_line(color = "steelblue4", size = 5)

#to pick out a color
colors()
#with labs
gapminder %>%
  filter(country == "Mexico") %>%
  ggplot(mapping = aes(x = year, y = lifeExp)) + geom_line(color = "steelblue4", size = 5) + labs(x = "Year", y = "Life Expectancy", title = "Life Expectancy in Mexico", subtitle = "1952 - 2007 (five year intervals)", caption = "Data: Gapminder")

#Task: Filter the dataset and create a line graph for Argentina and Bolivia; According to gapminder data, who has higher life expectancy? (hint: use time as x axis)
gapminder %>%
  filter(country == "Argentina" | country == "Bolivia") %>%
  ggplot(mapping = aes(x = year, y = lifeExp, color = country)) + geom_line(linetype = "dotted", size = 3) + labs(x = NULL, y = "Life Expectancy", color = "Country")

#let's do group_by() and summarize()

#what we currently have in the dataset are country gdps for particular years, but what if we wanted the average gdp for each continent?  And then to plot that across years? 
#group by, summarize, and arrange
#by continent and year
gapminder %>%
  group_by(continent, year) %>%
  summarize(continent_gdp = mean(gdpPercap)) %>%
  arrange(year)

#just by continent
gapminder %>%
  group_by(continent) %>%
  summarize(continent_gdp = mean(gdpPercap)) %>%
  arrange(continent)

#explain the difference between mutate (which creates a new variable in the dataset) and summarize, which collapses data in order to create a new var that is then stored (temporarily or perm with a new object) in a separate data frame 

#group by, summarize, and plot a line graph
gapminder %>%
  group_by(continent, year) %>%
  summarize(continent_gdp = mean(gdpPercap)) %>%
  ggplot(mapping = aes(x = year, y = continent_gdp, color = continent)) + geom_line(size = 2)

#Boxplots
#categorical and continuous variable
data(package = "usdata")
View(county)
dim(county)
?county
sum(is.na(county$median_hh_income)) #do we have any missing data?

#Basic Boxplot
county %>%
  ggplot(mapping = aes(x = state, y = median_hh_income)) + geom_boxplot()

#flipping the coordinates
county %>%
  ggplot(mapping = aes(x = state, y = median_hh_income)) + geom_boxplot() + coord_flip() + labs(x = NULL, y = "Household Income")

#reordering state by household income
county %>%
  ggplot(mapping = aes(x = reorder(state, median_hh_income), y = median_hh_income)) + geom_boxplot() + coord_flip() + labs(x = NULL, y = "Household Income")

#Geom_Bar and Geom_Col
#Question: Is your data pre-counted or not? 
#Not pre counted --> use geom_bar(), x = category
#Pre counted --> use geom_col(), x = category, y = counted number

library(socviz)

county_data %>%
  ggplot(mapping = aes(x = census_region)) + geom_bar()

#if we drop the NAs and then plot
county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = census_region)) + geom_bar()

#fill does a stacked barchart
county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = census_region, fill = partywinner16)) + geom_bar()

#you can do a dodged barplot with the argument position = "dodge"
county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = census_region, fill = partywinner16)) + geom_bar(position = "dodge")

#what if we want a bar chart for proportions rather than counts? 
county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = partywinner16, y = after_stat(prop), group = 1)) + geom_bar(color = "black", fill = "skyblue3")


colors()
# another way to drop NAs
drop_na(c(census_region, partywinner16)) 
