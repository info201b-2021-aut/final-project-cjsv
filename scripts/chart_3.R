library("dplyr")
library(tidyverse)
library(ggplot2)
library(patchwork)

park <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

#endangered & concerend & threatened species number of each national park
species_data <- species %>%
  group_by(park_name) %>%
  summarize(
    endangered_total = sum(conservation_status == "Endangered"),
    concerned_total = sum(conservation_status == "Species of Concern"),
    threatened_total = sum(conservation_status == "Threatened")
  )

#create a scatterplot of the endangered species number of each national park
chart_3 <- ggplot(data = species_data, aes(x = park_name))
  geom_point(aes_string(y = input$status)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(
    title = "Species in National Parks",
    x = "Park Name",
    y = "Number of Species"
  )
