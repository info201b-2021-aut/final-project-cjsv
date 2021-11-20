library("dplyr")
park <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

chart_3 <- function(species)
  
  #endangered species number of each national park
  endangered_speces <- species %>%
  group_by(park_name) %>%
  summarize(endangered_total = sum(conservation_status == "Endangered"))

#create a scatterplot of the endangered species number of each national park
ggplot(endangered_speces) +
  geom_point(mapping = aes (x=park_name, y = endangered_total)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  
  labs(
    title = "The Number of Endangered Species in Each National Park",
    x = "Park Name",
    y = "Number of Endangered Species"
  )




