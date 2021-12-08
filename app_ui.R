library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv")
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv")
orders <- unique(species$order)

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
    sidebarPanel(
      chart2_input <- selectInput(
        inputId = "unqorder", 
        label = "Select an order: ",
        choices = orders
      )
    ),
          
    
    mainPanel(
      # Display graph
      plotlyOutput("chart")
    )
  )  
  )

page_three <- tabPanel(
  "Chart 3",
  
  sidebarLayout(
    sidebarPanel(),
    
    mainPanel(
      # Display graph
      plotlyOutput("scatterplot")
    )
    
  )
)

conclusion <- tabPanel(
  "Conclusion",
  mainPanel(
    h1("Introduction"),
    p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
    
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
