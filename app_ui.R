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
  "chart_1",
  
  sidebarLayout(
    sidebarPanel(
      
      
      category_input <- selectInput(
        inputId = "category",
        label = "Select Category",
        choice = c("Bird", "Mammal", "Fish", "Vascular Plant")
      )
    ),
    
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
      
      conservation_input <- selectInput(
        inputId = "conservation",
        label = "Select a species status:",
        choices = list(
          "Endangered Species" = "endangered_total",
          "Threatened Species" = "threatened_total",
          "Species of Concern" = "concerned_total"
        ),
        selected = "endangered_total"
      )
    ),
    
    mainPanel(
      ui <- fluidPage(
        plotlyOutput("scatterplot")
      )
    ),
  )
)  

page_four <- tabPanel(
  "Chart 4",
  
  sidebarLayout(
    sidebarPanel(
      
      status_input <- selectInput(
        inputId = "status",
        label = "Select a species status:",
        choices = list(
          "Endangered Species" = "endangered",
          "Threatened Species" = "threatened",
          "Species of Concern" = "concerned"
        ),
        selected = "endangered"
      )
    ),
    
    mainPanel(
      ui <- fluidPage(
        plotlyOutput("map")
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
  page_four,
  conclusion
)
