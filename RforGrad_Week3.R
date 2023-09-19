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

#let's cover logical operators: %in%  ==  & |, etc. 
#tidy verbs:
# select
# filter
# mutate
# arrange
# summarize


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

#Base R: 
subset(fandango, subset = fandango$year == 2015)
#Tidy: 
fandango %>%
  filter(year == 2015)

#Task: How many movies have an IMBD rating greater than 8?          