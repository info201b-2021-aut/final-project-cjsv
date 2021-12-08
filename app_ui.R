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
      img(src = "https://greentumble.com/wp-content/uploads/2016/11/importance-of-national-parks.jpg")
    )
  
)

page_one <- tabPanel(
  "Barchart",
  
  sidebarLayout(
    sidebarPanel(),
    
    mainPanel(
      # Display graph
      plotlyOutput("barchart")
    )
    
  )
)

page_two <- tabPanel(
  "Unique Orders Chart",
  
  sidebarLayout(
    sidebarPanel(
      p("This chart gives a visualization of the level of biodiversity in different national parks across the U.S. 
        It was made using the number of unique orders (Carnivora, Rodentia, etc.) in each reported National Park, 
        and then grouping them together by state. From this chart, we can see that the distribution of biodiversity is varied and 
        doesn't have much pattern. The leading area by a large margin, California, has a reported 400 unique orders, and the
        reported state with the least biodiversity, New Mexico, has 72 unique orders in its national parks. This gives us insight 
        into the amount and state of national parks in the different regions, including the amount of reported orders. Here, this 
        interactive chart can help breakdown the orders that can be found in the different regions."),
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
  "Scatterplot",
  
  sidebarLayout(
    sidebarPanel(
      
      conservation_input <- selectInput(
        inputId = "conservation",
        label = "Select a conservation status:",
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
  "State Map",
  
  sidebarLayout(
    sidebarPanel(
      
      status_input <- selectInput(
        inputId = "status",
        label = "Select a conservation status:",
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
