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
  
  barchart2 <- function(orders){
    states <- merge(x = parks, y = species, all.x = TRUE)
    
    unique_species <- states %>%
      group_by(state)%>%
      filter(order == orders)%>%
      summarize(order_amount = length(order))%>%
      arrange(desc(order_amount))
    
    ggplot(unique_species, aes(x = state, y = order_amount))+
      geom_bar(stat="identity", fill=alpha("blue", 0.5))+
      labs(title = "Biodiversity in National Parks Across the United States by Unique Orders", x = "State", y = "Number of Unique Order")
  }
      
<<<<<<< HEAD
  output$chart <- renderPlotly({
    barchart2(input$unqorder)
  })
=======
 output$chart <- renderPlotly({
   barchart2(input$unqorder)
})
>>>>>>> aec354a0ef3c996f03254b72692bfb9ab30ee2d0
       
    
  # Render scatterplot
  output$scatterplot <- renderPlotly({
    chart_3(input$conservation)
  })
  
  # Render map
  output$map <- renderPlotly({
    chart_4(input$status)
  })
  
}

