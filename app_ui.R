library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

intro <- tabPanel(
  "Introduction",
  mainPanel(
    ui <- fluidPage(
      h1("Introduction"),
      p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
    
    )
  )
)

page_one <- tabPanel(
  "Chart 1",
  
  sidebarLayout(
    sidebarPanel(
      
      
    )
  ),
  
  mainPanel(
    ui <- fluidPage(
      # Display graph
      plotlyOutput("")
    )
  )
)

page_two <- tabPanel(
  "Chart 2",
  
  sidebarLayout(
    sidebarPanel(
      
      
    )
  ),
  
  mainPanel(
    ui <- fluidPage(
      # Display graph
      plotlyOutput("")
    )
  )
)

page_three <- tabPanel(
  "Chart 3",
  
  sidebarLayout(
    sidebarPanel(
      
      
    )
  ),
  
  mainPanel(
    ui <- fluidPage(
      # Display graph
      plotlyOutput("")
    )
  )
)

conclusion <- tabPanel(
  "Conclusion",
  mainPanel(
    ui <- fluidPage(
      h1("Conclusion"),
      p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
      
    )
  )
)

ui <- navbarPage(
  "Biodiversity Data Exploration",
  intro,
  page_one,
  page_two,
  page_three,
  conclusion
)