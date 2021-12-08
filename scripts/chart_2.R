library(tidyverse)
library(ggplot2)
library(patchwork)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv")
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv")

chart_2 <- function(parks, species){
  
states <- merge(x = parks, y = species, all.x = TRUE)

unique_species <- states %>%
  group_by(state)%>%
  summarize(species_amount = length(unique(order)))%>%
  arrange(desc(species_amount))

return(ggplot(unique_species, aes(x=state, y=species_amount)) + geom_bar(stat="identity", fill=alpha("blue", 0.5)) + 
  labs(title = "Biodiversity in National Parks Across the United States by Number of Unique Orders", x="State", y="Number of Unique Orders"))
}
