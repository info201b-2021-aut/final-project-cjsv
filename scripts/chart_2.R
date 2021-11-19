library(tidyverse)
library(ggplot2)
library(patchwork)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv")
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv")

states <- merge(x = parks, y = species, all.x = TRUE)

unique_species <- states %>%
  group_by(state)%>%
  summarize(species_amount = length(unique(order)))%>%
  mutate(id = seq(1,27))


label_data <- unique_species
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5)/number_of_bar

label_data$hjust <- ifelse(angle < -90, 1, 0)

label_data$angle <- ifelse(angle < -90, angle+180, angle)

label_data$state <- paste(labe_data$state, " (", label_data$species_amount, ")", sep="")

chart_2 <- ggplot(unique_species, aes(x = as.factor(state), y = species_amount))+
  geom_bar(stat="identity", fill=alpha("blue", 0.3))+
  ylim(-100, 450)+
  theme_minimal()+
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-2,4), "cm")
  )+
  coord_polar(start = 0) +
  geom_text(data = label_data, aes(x=state, y=species_amount+10, label = state, hjust = hjust), color = "black", 
            fontface = "bold", alpha = 0.6, size = 2.5, angle = label_data$angle, inherit.aes = FALSE)+
  geom_text(aes(x=27.5, y=350, label = "Number of Unique Orders in National Parks Across the United States"), 
            color = "black", inherit.aes = FALSE)

