library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

source("scripts/chart_1.R")
source("scripts/chart_2.R")
source("scripts/chart_3.R")

server <- function(input, output) {
  
  # Render a plotly object that returns a barchart
  #output$barchart <- renderPlotly({
  #  chart_1
  #})
  
  # Render barchart
  #output$barchart <- renderPlotly({
  #  chart_2
  #})
  
  # Render catterplot
  output$scatterplot <- renderPlotly({
    chart_3(input$conservation)
  })
    
}

