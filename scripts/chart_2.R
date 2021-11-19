library(tidyverse)
library(ggplot2)
library(patchwork)
library(maps)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv")
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv")

states <- merge(x = parks, y = species, all.x = TRUE)

unique_species <- states %>%
  group_by(state)%>%
  summarize(species_amount = length(unique(order)))

state <- map_data("state")
chart_2 <- ggplot() +
  geom_polygon(data = state, aes(x = long, y = lat, group = group), color = "grey", fill = "white") +
  geom_point(data = biodiversity, aes(x = longitude, y = latitude))