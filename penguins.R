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
x = penguins %>%
  count(species)

#summary of the dataset
summary(penguins)

#looking for duplicated rows
n_distinct(penguins)

#unique penguin species
penguins %>% 
  distinct(species)

#count
penguins %>% 
  count(species, island)

# checking correlation between numeric variables
penguins %>% 
  drop_na() %>% 
  select_if(is.numeric) %>% 
  cor()

penguins %>%
    drop_na()

ggplot(penguins) +
  geom_point(aes(flipper_length_mm, body_mass_g, color = species))

ggplot(penguins) +
  geom_point(aes(bill_depth_mm, body_mass_g, color = species))

ggplot(penguins) +
  geom_point(aes(bill_length_mm, body_mass_g, color = species))

ggplot(penguins) +
  geom_point(aes(sex, body_mass_g, color = species))

ggplot(penguins) +
  geom_histogram(aes(x=bill_length_mm, fill = species))


# penguins by sex
penguins_by_sex <- penguins %>% 
  filter(!is.na(sex)) %>% 
  group_by(species, sex) %>% 
  summarise(bill_depth_mm = mean(bill_depth_mm),
            bill_length_mm = mean(bill_length_mm),
            flipper_length_mm = mean(flipper_length_mm),
            body_mass_g = mean(body_mass_g))
ggplot(penguins_by_sex, aes(x = species, y = flipper_length_mm, fill = sex)) +
  geom_col(position = position_dodge())

# density plot
ggplot(penguins) +
  geom_density(aes(x = species, fill = species, alpha = 0.4))
