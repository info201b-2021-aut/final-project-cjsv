library(tidyverse)
library("dplyr")
library(ggplot2)
library(knitr)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

chart_1 <- function(parks, species){
  speciesandparks <- left_join(species, parks, by = "park_name")
  
  num_native_species <- speciesandparks %>%
  group_by(state) %>%
  summarise(native_sum = sum(nativeness == "Native"))
  
  num_species_state <- speciesandparks %>%
  group_by(state) %>%
  summarise(species_sum = length(nativeness))
  
  species_state_table <- merge(num_native_species, num_species_state)
  
  species_state_table <- species_state_table %>%
  mutate(native_species_prop = native_sum / species_sum)
  
  return(ggplot(data = species_state_table) +
           geom_col(mapping = aes(x = state, y = native_species_prop)) +
           labs(title = "Percentage of Native Species by State",
                x = "States",
                y = "Percentage of Native Species")
           )
}