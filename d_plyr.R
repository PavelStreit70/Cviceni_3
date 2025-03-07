#install dplyr

install.packages("dplyr")

library ("babynames")
library ("dplyr")

data("babynames")

babynames

#Všechny řádky kde je prop větší než 0.08

filter(babynames, prop >= 0.08)
