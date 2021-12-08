library(tidyverse)
library(dplyr)
library(plotly)
library(patchwork)
library(shiny)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

# Blank theme
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )

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
  mutate(native_species_prop = native_sum / species_sum)

chart_1 <- function(category_input) {
  barchart <- ggplot(species_by_category, aes(x = state)) +
    geom_col(mapping = aes_string(y = category_input)) +
    labs(title = "Percentage of Native Species by State",
         x = "States",
         y = "Percentage of Native Species")
}
  
  
  
      