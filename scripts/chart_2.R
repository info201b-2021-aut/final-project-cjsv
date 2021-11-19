library(tidyverse)
library(ggplot2)
library(patchwork)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv")
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv")

states <- merge(x = parks, y = species, all.x = TRUE)
unique_species <- num(unique(states$order))