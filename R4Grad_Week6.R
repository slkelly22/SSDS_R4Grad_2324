#R4Grad Week 6 Syntax - Plotting with ggplot2 continued

library(tidyverse)
library(gapminder) 
install.packages("socviz")
library(socviz)

search() #to confirm packages are loaded
#----
#cover for Week 6: 
geom_boxplot()
geom_bar() geom_col()
geom_line()
#Move Quarto to Week 7
-----

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
install.packages("socviz")
library(socviz)
data(package = "socviz")
View(county_data)
dim(county_data)
county_data$hh_income  
?county_data
sum(is.na(county_data$hh_income)) #do we have any missing data?

#Basic Boxplot
county_data %>%
  ggplot(mapping = aes(x = state, y = hh_income)) + geom_boxplot()

#flipping the coordinates
county_data %>%
  ggplot(mapping = aes(x = state, y = hh_income)) + geom_boxplot() + coord_flip()

#reordering state by household income
county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = reorder(state, hh_income), y = hh_income)) + geom_boxplot() + coord_flip() + labs(x = NULL, y = "Household Income")

#Geom_Bar and Geom_Col
#Question: Is your data pre-counted or not? 
#Not pre counted --> use geom_bar(), x = category
#Pre counted --> use geom_col(), x = category, y = counted number

county_data %>%
  ggplot(mapping = aes(x = census_region)) + geom_bar()

#fill does a stacked bar plot
county_data %>%
  ggplot(mapping = aes(x = census_region, fill = state)) + geom_bar()

#see if there's a difference between drop_na() and drop_na(c(var1, var2))
county_data %>%
  drop_na(c(census_region, partywinner16)) %>%
  ggplot(mapping = aes(x = census_region, fill = partywinner16)) + geom_bar()

#you can do a dodged barplot with the argument position = "dodge"
county_data %>%
  drop_na(c(census_region, partywinner16)) %>%
  ggplot(mapping = aes(x = census_region, fill = partywinner16)) + geom_bar(position = "dodge")

county_data %>%
  drop_na() %>%
  ggplot(mapping = aes(x = census_region, fill = partywinner16)) + geom_bar()
#they look the same. There might not be much missing in these vars...let's check

sum(is.na(county_data)) #950
sum(is.na(county_data$census_region)) #1
sum(is.na(county_data$partywinner16)) #54

#let's check this way

county_data %>%
  drop_na(c(census_region, partywinner16)) %>%
  count(census_region, partywinner16) 

county_data %>%
  drop_na() %>%
  count(census_region, partywinner16) 
#the only differnce I see is that the first code has 336 for West Repulican and the second code has 307

summary(county_data)

#what if we want a bar chart for proportions rather than counts? -- see R for DS (2), p. 132
ggplot(county_data, mapping = aes(x = partywinner16, y = after_stat(prop), group = 1)) + geom_bar()
