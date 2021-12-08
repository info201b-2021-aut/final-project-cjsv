library(tidyverse)
library(dplyr)
library(plotly)
library(patchwork)
library(shiny)
categories <- unique(species$category)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

#join species and parks
speciesandparks <- left_join(species, parks, by = "park_name")

#find the number of native species by state and category
species_by_state <- speciesandparks %>%
  group_by(state) %>%
  filter(scientific_name == unique(scientific_name))

num_native_species_category <- species_by_state %>%
  group_by(state, category) %>%
  summarise(native_sum = sum(nativeness == "Native"))

#total species by category and state
num_species_by_category <- species_by_state %>%
  group_by(state, category) %>%
  summarise(species_sum = length(nativeness))

#find prop of native species to total species by category
species_by_category <- merge(num_native_species_category, num_species_by_category)

species_by_category <- species_by_category %>%
  group_by(state)%>%
  mutate(native_species_prop = native_sum / species_sum) %>%
  arrange(category)
<<<<<<< HEAD
  
chart_1 <- function(categories) {
  barchart <- ggplot(species_by_category, x = state, y = native_species_prop) +
    geom_col(mapping = aes(x = state, y = native_species_prop))
=======

bird <- species_by_category %>%
  filter(category == "bird") %>%
  summarize(
    state = state, 
    bird = native_species_prop
  ) 

mammal <- species_by_category %>%
  filter(category == "mammal") %>%
  summarize(
    state = state, 
    mammal = native_species_prop
  )

fish <- species_by_category %>%
  filter(category == "fish") %>%
  summarize(
    state = state, 
    fish = native_species_prop
  )

category_data <- merge(merge(bird, mammal),fish)

chart_1 <- function(category_input) {
  barchart <- ggplot(category_data, aes(x = state)) +
    geom_col(mapping = aes_string(y = category_input)) +
>>>>>>> 6654a170c4dfaf0d5cac782bae1e5d6a158ce4c5
    labs(title = "Percentage of Native Species by State",
         x = "States",
         y = "Percentage of Native Species")
  return(barchart)
}
  
  
  
      