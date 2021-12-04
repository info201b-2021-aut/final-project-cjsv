library("dplyr")
library(tidyverse)
library(ggplot2)
library(patchwork)

park <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)


  
#endangered species number of each national park
endangered_speces <- species %>%
group_by(park_name) %>%
summarize(endangered_total = sum(conservation_status == "Endangered"))

#create a scatterplot of the endangered species number of each national park
chart_3 <- ggplot(endangered_speces) +
  geom_point(mapping = aes (x=park_name, y = endangered_total)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    
  labs(
    title = "Endangered Species in National Parks",
    x = "Park Name",
    y = "Number of Endangered Species"
  )





