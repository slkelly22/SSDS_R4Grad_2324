#R for Graduate Students, 2023-24
#Week 1
#S.Kelly

#Understanding Packages
#shows your downloaded packages
library()

#how to download a package, put package name in parentheses; alternatively, use Packages - Install button
install.packages("tidyverse")

#shows you active (loaded) packages
search()

#loads the tidyverse package so you can use it
library(tidyverse)
#note: you can't load/activate a package that you haven't installed. 
#You only need to install a package one, but you need to load a package every time you want to use the package. 

#if you want help, you can use ? 
?mean

#Next Week
#reading in data
SK_geology_7.10.23 <- read.csv("~/Desktop/SK_geology_7.10.23.csv")
