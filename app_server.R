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
  
  # Render a plotly object that returns an interactive map
  output$barchart <- renderPlotly({
    return(chart_1(read.csv("scripts/data/national_parks_biodiversity/parks.csv"), read.csv("scripts/data/national_parks_biodiversity/species.csv")))
  })
  
  # Render a plotly object that returns a bar chart
    
  barchart_2 <- function(orders){
    states <- merge(x = parks, y = species, all.x = TRUE)
    
    unique_species <- states %>%
      group_by(state)%>%
      filter(order == orders)%>%
      summarize(order_amount = length(order))%>%
      arrange(desc(order_amount))
  
    
    chart2 <- ggplot(unique_species, aes(x=state, y=order_amount)) + geom_bar(stat="identity", fill=alpha("blue", 0.5)) + 
             labs(title = "Biodiversity in National Parks Across the United States by Number of Unique Orders", x="State", y="Number of Unique Orders")
  }
     output$chart <- renderPlotly({
      barchart_2(input$unqorder)
    })
  
  # Render a plotly object that returns a line chart
  output$scatterplot <- renderPlotly({
    return(chart_3(read.csv("scripts/data/national_parks_biodiversity/species.csv")))
  })
}

