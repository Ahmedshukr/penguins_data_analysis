install.packages("tidyverse")
install.packages("palmerpenguins")

library(ggplot2)
library(tidyverse)
library(dplyr)
library(palmerpenguins)

data("penguins")
View(penguins)

# Assessing the dataset
head(penguins)
tail(penguins)

colnames(penguins)

# let us asses the structure of the dataset
str(penguins)

#glimpse the dataset
glimpse(penguins)

#count the penguin's species in the dataset
penguins %>%
  count(species)

#summary of the dataset
summary(penguins)

#looking for duplicated rows
n_distinct(penguins)

# checking correlation between numeric variables
penguins %>% 
  drop_na() %>% 
  select_if(is.numeric) %>% 
  cor()

penguins %>%
  drop_na()

ggplot(penguins) +
  geom_point(aes(flipper_length_mm, body_mass_g, color = species))

ggsave("")













ggplot(penguins) +
  geom_density(aes(x = species, fill = species, alpha = 0.4))
