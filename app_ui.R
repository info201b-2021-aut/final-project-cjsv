library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

intro <- tabPanel(
  "Introduction",
  mainPanel(
      h1("Introduction"),
      p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
    
    )
  
)

page_one <- tabPanel(
  "Chart 1",
  
  sidebarLayout(
    sidebarPanel(),
    
    mainPanel(
      # Display graph
      plotlyOutput("barchart")
    )
    
  )
)

page_two <- tabPanel(
  "Chart 2",
  
  sidebarLayout(
    sidebarPanel(),
    
    mainPanel(
      # Display graph
      plotlyOutput("chart")
    )
    
  )
)

page_three <- tabPanel(
  "Chart 3",
  
  sidebarLayout(
    sidebarPanel(
      
      status_input <- selectInput(
        inputId = "conservation",
        label = "Select a species status:",
        choices = list(
          "Endangered Species" = "endangered_total",
          "Species of Concern" = "concern_total", 
          "Threatened Species" = "threatened_total"
        ),
        selected = "endangered_total"
      )
    ),
    
    mainPanel(
      ui <- fluidPage(
        plotlyOutput("scatterplot"),
      )
    ),
  )
)  


conclusion <- tabPanel(
  "Conclusion",
  mainPanel(
    h1("Conclusion"),
    p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
    
  )
  
)

ui <- navbarPage(
  "Biodiversity Data Exploration",
  theme = "styles.css",
  intro,
  page_one,
  page_two,
  page_three,
  conclusion
)
