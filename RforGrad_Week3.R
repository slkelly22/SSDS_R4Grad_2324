#R for Graduate Students, 2023-24
#Week 3
#S.Kelly

library(tidyverse)

squirrels_data <- read.csv("~/Desktop/Abbrev_Central_Park_Squirrels_2018.csv")

?count
#follow up on a question from Week 2 about whether you can count more than one variable at a time; answer: yes
squirrels_data %>%
  count(shift, age) 

#also should answer the lubridate / date --> back to number issue from last week

#Rather than uploading a dataset, we'll practice using datasets that already exist within R packages
install.packages("fivethirtyeight")
library(fivethirtyeight)
?fivethirtyeight
data(package = "fivethirtyeight")
View(fandango)

#add this to my things to remember code; this tells you the datasets that live within that package
data(package = "palmerpenguins")
data(package = "gapminder")
data(package = "moderndive")
data(package = "lavaan")

#what about how to call a function from within a package that isn't loaded
dplyr::select
#yeah but will the %>% work without loading tidy? 

#tidy verbs:
# select
# filter
# mutate
# arrange
# summarize

# add COUNT - did we do last week? what about unique

library(tidyverse)
library(fivethirtyeight)
search() #what does this do again? 

dim(fandango) #146, 23
View(fandango)
head(fandango, 10)
head(fandango$film, 10) #you can even call head or tails on a particular variable; add this to my yellow notebook too
tail(fandango$year, 5)

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

#Do a Task here

#How do we grab observations? 
#Base R: dollar sign and subset
#Tidy: pipe and filter

#here is where we need to go over logical comparisons and boolean
#let's cover logical operators: %in%  == , etc & is AND, | is OR, ! is NOT

#Base R: 
subset(fandango, subset = fandango$year == 2015)
#Tidy: 
fandango %>%
  filter(year == 2015)

#Task: How many movies have an IMBD rating greater than 8?          
#Base R: 
subset(fandango, subset = fandango$IMBD > 8)
#Tidy: 
fandango %>%
  filter(year > 8)

#combo task
#How many movies in the fandango dataset were from 2014 and had an rottentomatoes rating less than 30? #Hint: use filter (not select)

fandango %>%
  filter(year == 2014 & rottentomatoes < 30)
#Film: Annie

#mutate
#Mutate allow you to create a new variable from an existing one

#creating a new standardized measure
sk_fandango <- fandango %>%
  mutate(z_fandango_votes = scale(fandang0_votes)
#lots of ways to change variables...
#mutate(new variable = old variable / 12)
#mutate(new variable = log(old variable))

#how to change our dataset and then save to a new object, then export
