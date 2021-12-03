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
projectserver <- function(input, output) {
  
  # Render a plotly object that returns an interactive map
  output$barchart <- renderPlotly({
    return(chart_1)
  })
  
  # Render a plotly object that returns a bar chart
  output$chart <- renderPlotly({
    return(chart_2)
  })
  
  # Render a plotly object that returns a line chart
  output$scatterplot <- renderPlotly({
    return(chart_3)
  })
}

