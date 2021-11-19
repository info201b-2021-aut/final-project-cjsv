# Aggregate Table

# This function creates a table summarizing 
# the total number of species (by category) in each park, 
# summarizes how many of those species are of concern, threatened, or endangered,
# and calculates the proportion.

library("tidyverse")

# Group tables 
species_table <- species %>%
  group_by(park_name) %>%
  summarize(species_total = length(common_names)) 

endangered_table <- species %>%
  group_by(park_name) %>%
  summarize(endangered_total = sum(conservation_status == "Endangered")) 

threatened_table <- species %>%
  group_by(park_name) %>%
  summarize(threatened_total = sum(conservation_status == "Threatened"))

concerned_table <- species %>%
  group_by(park_name) %>%
  summarize(concerned_total = sum(conservation_status == "Species of Concern"))

# Joining tables
first_joined_table <- left_join(species_table, endangered_table)
second_joined_table <- left_join(first_joined_table, threatened_table)
final_table <- left_join(second_joined_table, concerned_table)

# Adding sum  of endangered, threatened, or species of concern 
final_table <- mutate(final_table, etc_total = endangered_total + threatened_total + concerned_total)

# Percent fucntion
percent <- function(x, digits = 2, format = "f", ...) {      
  paste0(formatC(x * 100, format = format, digits = digits, ...), "%")
}

# Find proportion of endangered, threatened, or species of concern to total species, 
# and arrange 
final_table <- mutate(final_table, proportion = percent(etc_total/species_total)) %>%
  arrange(desc(proportion))

# Remove other columns 
final_table <- subset(final_table, select = -c(endangered_total, threatened_total, concerned_total, etc_total))

#Function
aggregate_table <- function(df) {
  species <- df
  mapply(format, final_table, justify=c("left", "right", "right")) 
}

