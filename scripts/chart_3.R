library(dplyr)
library(tidyverse)
library(ggplot2)
library(patchwork)
library(shiny)

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
chart_3 <- function(conservation_input){
  graph <- ggplot(data = species_data, aes(x = park_name, color = park_name)) +
    geom_point(aes_string(y = conservation_input)) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 5), legend.text=element_text(size=5),
          
          legend.spacing.x = unit(0.5, 'cm')) +
    labs(
      title = "Species Conservation Status in National Parks",
      x = "Park Name",
      y = "Number of Species"
      )
  return(graph)
}
