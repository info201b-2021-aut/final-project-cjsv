library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

# Read in Data
source("scripts/aggregate_table.R")
source("scripts/summary_info.R")
source("scripts/chart_1.R")
source("scripts/chart_2.R")
source("scripts/chart_3.R")


# Start shinyServer
server <- function(input, output) {
  
  # Render a plotly object that returns a barchart
  output$barchart <- renderPlotly({
    return(chart_1(read.csv("scripts/data/national_parks_biodiversity/parks.csv"), read.csv("scripts/data/national_parks_biodiversity/species.csv")))
  })
  
  # Render a plotly object that returns a chart
  output$chart <- renderPlotly({
    return(chart_2(read.csv("scripts/data/national_parks_biodiversity/parks.csv"), read.csv("scripts/data/national_parks_biodiversity/species.csv")))
  })
  
  # Render a plotly object that returns a scatterplot
  output$scatterplot <- renderPlotly({
    return(chart_3(read.csv("scripts/data/national_parks_biodiversity/species.csv")))
  })
}

