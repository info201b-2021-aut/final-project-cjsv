library(dplyr)
library(ggplot2)
library(patchwork)
library(shiny)
library("openintro")

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

# Join park and species data 
parks_species <- left_join(species, parks, by = "park_name")

# Map df
species_by_state <- data.frame(
  state = c(parks_species$state),
  long = c(parks_species$longitude),
  lat = c(parks_species$latitude),
  status = c(parks_species$conservation_status)
)

species_by_state <- species_by_state %>%
  group_by(state) %>%
  summarize(
    endangered = sum(status == "Endangered"),
    concerned = sum(status == "Species of Concern"),
    threatened = sum(status == "Threatened")
  ) %>%
  mutate(state = tolower(abbr2state(state))) 

# Merged Data
map_data <- map_data("state") %>%
  rename(state = region) %>% 
  left_join(species_by_state, by = "state") %>%
  select(long, lat, group, order, state, endangered, concerned, threatened) %>%
  na.omit()

# Create map 
chart_4 <- function(status_input) {
  map <- ggplot(map_data, aes(x = long, y = lat, group = group)) +
    geom_polygon(
      aes(fill = status_input),
      color = "white", 
      size = .1) +
    coord_map() +
    scale_fill_continuous(low = "#132B43", high = "Red") +
    labs(fill = "Total of Species",
         title = "Species of Concern, Threatened or Endangered in National Parks") +
    blank_theme
  return(map)
}




