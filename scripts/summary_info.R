library("tidyverse")

#Species Data Set 
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

# Summary Information

summary_info <- list()

#Total species 
summary_info$total_species<- nrow(species)

# Total parks 
summary_info$total_parks <- species %>%
  group_by(park_name) %>%
  count() %>%
  nrow()

# Total of categories of species (e.g. mammal, bird, etc.)
summary_info$total_categories <- species %>%
  group_by(category) %>%
  count() %>%
  nrow() 

# Total of different types of species (e.g. moose, bat, etc.)
summary_info$total_species_type <- species %>%
  group_by(common_names) %>%
  count() %>%
  nrow() 

# Total of rare species 
summary_info$total_rare <- species %>%
  group_by(abundance) %>%
  filter(abundance == "Rare", na.rm = TRUE) %>%
  nrow()

# Total species endangered
summary_info$total_endangered <- species %>%
  filter(conservation_status == "Endangered") %>%
  nrow()

# Get summary info 
get_summary_info <- function(df) {
  species <- df
  return (summary_info)
}


  
  
