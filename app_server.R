library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

# Data 
park <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)

# Chart 1 Data 

# Chart 2 Data 

# Chart 3 Data 
species_data <- species %>%
  group_by(park_name) %>%
  summarize(
    endangered_total = sum(conservation_status == "Endangered"),
    concerned_total = sum(conservation_status == "Species of Concern"),
    threatened_total = sum(conservation_status == "Threatened")
  )

server <- function(input, output) {
  
  # Render a plotly object that returns a barchart
  #output$barchart <- renderPlotly({
  #  chart_1
  #})
  
  # Render a plotly object that returns a chart
  #output$barchart <- renderPlotly({
  #  chart_2
  #})
  
  # Render a plotly object that returns a scatterplot
  output$scatterplot <- renderPlotly({
    
    chart_3 <- ggplot(data = species_data, aes(x = park_name)) +
    geom_point(aes_string(y = input$conservation)) +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
      labs(
        title = "Species in National Parks",
        x = "Park Name",
        y = "Number of Species"
      )
    
  })
}

