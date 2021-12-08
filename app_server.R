library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

source("scripts/chart_1.R")
source("scripts/chart_2.R")
source("scripts/chart_3.R")
source("scripts/chart_4.R")

server <- function(input, output) {
  
  # Render a plotly object that returns a barchart
  output$barchart <- renderPlotly({
    chart_1(input$category)
  })
  
  # Render barchart
  #output$barchart <- renderPlotly({
  #  chart_2
  #})
  
  # Render scatterplot
  output$scatterplot <- renderPlotly({
    chart_3(input$conservation)
  })
  
  # Render map
  output$map <- renderPlotly({
    chart_4(input$status)
  })
  
}

