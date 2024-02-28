#R for Graduate Students, Spring 2024
#Week 3
#S.Kelly

#Rather than uploading an external dataset, we're going to use datasets that already exist within R packages
#we need to install (if you don't have it) and load the fivethirtyeight package
install.packages("fivethirtyeight")
library(fivethirtyeight)
?fivethirtyeight
data(package = "fivethirtyeight")
?fandango

#another example is lavaan, an SEM package
#note: you have to have the library installed in order to call the data out
install.packages("lavaan")
data(package = "lavaan")

#back to the fivethirtyeight package that includes a dataset called fandango
#Let's get a quick overview of the dataset using the functions we've already learned

View(fandango) #base
dim(fandango) #base
summary(fandango) #base R

head(fandango, 10)
head(fandango$film, 10) #you can even call head or tails on a particular variable
tail(fandango$film, 5)

#Tidy functions / verbs to discuss today
#we learned count() last time; not using count here because we have numerical data, not categorical groupings
#new verbs: ARRANGE, SELECT, FILTER, MUTATE

library(tidyverse)
search() #this tells you what packages are activated and available to use
glimpse(fandango) #this is a tidy function, from dplyr

#How do we sort / reorder a dataset? 
#arrange is part of dplyr

fandango %>%
  arrange(rottentomatoes) %>%
  head(5) #default is ascending

fandango %>%
  arrange(desc(rottentomatoes)) %>% #you can change to a descending order
  head(5)

fandango %>%
  arrange(rottentomatoes, desc(year)) %>%
  head(10)
View(fandango)
#Is the reordering permanent? 

#How do we grab columns / variables? 
#Base R: Dollar signs and brackets
#Dollar sign
fandango$film

#brackets [row, column]
fandango[, "film"]
fandango[, 1]

#Tidyverse: piping and select function
fandango %>% select(film)
#generally set up like this: 
fandango %>%
  select(film) #note: there's nothing permanent because we are not making new objects

#what do these do? 
fandango %>%
  select(-fandango_difference)

fandango %>%
  select(film:metacritic)

fandango %>%
  select(starts_with("metacritic"))

#how do I know what arguments exist? 
?select

#you can combine
fandango %>%
  select(film, year, rt_norm:metacritic_norm, fandango_difference) 

#How do we grab observations? 
#Base R: and subset
#Tidy: pipe and filter

#here is where we need to go over logical comparisons and Boolean
# >, <, ==, %in%
#& is AND, | is OR, ! is NOT
#we'll need to practice this info

#Base R: 
subset(fandango, subset = fandango$year == 2015)
#Tidy: 
fandango %>%
  filter(year == 2015)

#Task: How many movies have an IMBD rating greater than 8?          
#Base R: 
subset(fandango, subset = fandango$imdb > 8)
#Tidy: 
fandango %>%
  filter(imdb > 8)

#combo task
#How many movies in the fandango dataset were from 2014 and had an rottentomatoes rating less than 30? #Hint: use filter (not select)

fandango %>%
  filter(year == 2014 & rottentomatoes < 30)
#Film: Annie

#mutate
#Mutate allow you to create a new variable from an existing one

#creating a new standardized measure
sk_fandango <- fandango %>%
  mutate(z_metacritic = scale(metacritic))

cor(sk_fandango$metacritic, sk_fandango$z_metacritic) #correlation is 1

#lots of ways to change variables...
#mutate(new variable = old variable / 12)
#mutate(new variable = log(old variable))

#relocate
args(relocate)

sk_fandango <- sk_fandango %>%
  relocate(fandango_difference, .after = year)

sk_fandango <- relocate(sk_fandango, fandango_difference, .after = year)

View(sk_fandango)




#Next week: moving into ggplot and learning more functions like summarize and group_by