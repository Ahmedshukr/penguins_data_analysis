install.packages("tidyverse")
install.packages("palmerpenguins")

library(ggplot2)
library(dplyr)
library(palmerpenguins)

data("penguins")
View(penguins)

# let us asses the structure of the dataset
str(penguins)

#glimpse the dataset
glimpse(penguins)

#count the penguin's species in the dataset
count(penguins, species)



ggplot(penguins) +
  geom_density(aes(x = species, fill = species, alpha = 0.4))
