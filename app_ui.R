library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

intro <- tabPanel(
  "Introduction",
  mainPanel(
      h1("Introduction"),
<<<<<<< HEAD
      p("As you introduce your small project, you should describe the
          variables that you've chosen to analyze. In doing so, make clear
          which measure(s) of CO2 emission you are focusing on. Then, you
          will share at least 5 relevant values of interest. These will
          likely be calculated using your DPLYR skills")
    
=======
      includeCSS("styles.css"),
      p("Our domain of interest is biodiversity conservation. 
        We are interested in this domain because we humans are exceeding the 
        one of nine planetary boundaries --biosphere integrity especially 
        genetic biodiversity. It is urgent for us to find as much as information, 
        analyze it, and develop solutions to prevent biodiversity from further 
        reducing and help mitigate the negative impacts."),
      p("The purpose and importance of this project is to learn more about 
        the trends of biodiversity. As humans are quickly exceeding one of the 
        nine planetary boundaries, biosphere integrity 
        (especially genetic biodiversity), it is urgent for us find information, 
        analyze it, and understand the trends of biodiversity to develop 
        solutions to prevent biodiversity from further reducing and 
        to help mitigate its negative impacts."),
      p("Questions we want to answer"),
      img(src = "https://media.tehrantimes.com/d/t/2020/10/13/3/3578658.jpg")
>>>>>>> 870da951e78728e89dc4f03618b9e6ae615d3650
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
  title = "Biodiversity Data Exploration",
  theme = "styles.css",
  intro,
  page_one,
  page_two,
  page_three,
  page_four,
  conclusion
)
