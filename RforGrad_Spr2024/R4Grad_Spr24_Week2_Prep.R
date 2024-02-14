View(Squirrel_Data)
library(tidyverse)

glimpse(Squirrel_Data)

Squirrel_Data %>%
  count(age, running)

Squirrel_Data %>%
  drop_na() %>%
  count(age, running)

skimr::skim(Squirrel_Data)
