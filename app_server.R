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
    chart_1
  })
  
  # Render a plotly object that returns a chart
  output$chart <- renderPlotly({
    chart_2
  })
  
  # Render a plotly object that returns a scatterplot
  output$scatterplot <- renderPlotly({
    chart_3
  })
}

