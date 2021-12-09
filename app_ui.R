library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

parks <- read.csv("scripts/data/national_parks_biodiversity/parks.csv", stringsAsFactors = FALSE)
species <- read.csv("scripts/data/national_parks_biodiversity/species.csv", stringsAsFactors = FALSE)
orders <- unique(species$order)

intro <- tabPanel(
  h5("Introduction"),
  mainPanel(
      includeCSS("styles.css"),
      
      h1("Introduction"),
      p("Our domain of interest is biodiversity conservation. 
        We are interested in this domain because we humans are exceeding one of the 
        nine planetary boundaries, biosphere integrity (especially 
        genetic biodiversity). Therefore, the purpose of this project is to learn
        more about the trends of biodiversity in order to
        increase awareness and develop solutions to prevent biodiversity from further 
        decreasing and to help mitigate the negative impacts."),
      
      h1("Questions we want to answer:"),
      p("- What is the status of invasive species in different regions of the U.S.?"),
      p("- Which areas in the U.S. have the most and least biodiversity?"),
      p("- What areas in the U.S. are experiencing biodiversity loss?"),
      img(src = "https://media.tehrantimes.com/d/t/2020/10/13/3/3578658.jpg")
    )
  
) 

page_one <- tabPanel(
  h5("Native Proportion"),

  sidebarLayout(
    sidebarPanel(
      category_input <- selectInput(
        inputId = "chosencategory",
        label = "Select category of species: ",
        choice = c("Birds" = "bird",
                   "Fish" = "fish",
                   "Mammals" = "mammal",
                   "Reptiles" = "reptile",
                   "Vascular Plants" = "vascular_plant"),
      )
    ),
    
    mainPanel(
      # Display graph
      ui <- fluidPage(
        plotlyOutput("barchart"),
        p("The data-driven question we hope to answer from this map is: 
          what is the status of invasive species in different regions?"),
        p("This chart shows the percentage of native species by category in 
        national parks. The parks were grouped together by state. Some states 
          do not have national parks hence why they are not on the chart. 
          Additionally, some parks stretch across several states like the Death 
          Valley National Park which is in both CA and NV. Based on the chart, 
          the birds category has the highest percentage of native species across 
          almost all states. Meanwhile, in the fish category, there are many
          states were the native fish species are very low. Since invasive 
          species are detrimental to regional ecosystems, it is important to 
          monitor them to understand the status of our national parks. ")
      )
    )
    
  )
)


page_two <- tabPanel(
  h5("Unique Orders"),
  
  sidebarLayout(
    sidebarPanel(
      chart2_input <- selectInput(
        inputId = "unqorder", 
        label = "Select order: ",
        choices = orders
      )
    ),

    mainPanel(
      plotlyOutput("chart"),
      p("The data-driven question we hope to answer from this graph is: Which areas in the U.S. have the most and least biodiversity?"),
      p("This chart gives a visualization of the level of biodiversity in different national parks across the U.S. 
        It was made using the number of unique orders (Carnivora, Rodentia, etc.) in each reported National Park, 
        and then grouping them together by state. From this chart, we can see that the distribution of biodiversity is varied and 
        doesn't have much pattern. The leading area by a large margin, California, has a reported 400 unique orders, and the
        reported state with the least biodiversity, New Mexico, has 72 unique orders in its national parks. This gives us insight 
        into the amount and state of national parks in the different regions, including the amount of reported orders. Here, this 
        interactive chart can help breakdown the orders that can be found in the different regions, and it hopes to answer the question
        of which areas are the most and least biodiverse.")
    )
  )

)

page_three <- tabPanel(

  h5("Conservation in Parks"),
  
  sidebarLayout(
    sidebarPanel(
      
      conservation_input <- selectInput(
        inputId = "conservation",
        label = "Select conservation status:",
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
        plotlyOutput("scatterplot"),
        p("The data-driven question we hope to answer from this map is: 
          which areas are experiencing biodiversity loss?"),
        p("This scatterplot describes either the number of endangered species, threatened species, 
          or species of concerns in each national park. On the plot, each dot with different colors
          represents various national parks. It is suggested that the number of endangered species
          ranges from 0-44, the number of threatened species ranges from 0-16, and the number of species
          of concern ranges from 21-177 in each national park."),
      )
    ),
  )
) 

page_four <- tabPanel(
  h5("Conservation in the U.S."),
  
  sidebarLayout(
    sidebarPanel(
      
      status_input <- selectInput(
        inputId = "status",
        label = "Select conservation status:",
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
        plotlyOutput("map"),
        p("The data-driven question we hope to answer from this map is: 
          which areas are experiencing biodiversity loss?"),
        p("This map of the U.S. visualizes the number of species that are either 
          endangered, threatened, or are species of concern in each state that
          has a national park. The brighter shade of red indicates that the 
          state has a higher number of species that either endangered, threatened, 
          or of concern, while states with a darker shade of color have less species 
          in one of these categories. States without national parks are grey.")
      )
    )
  )
)

takeaways <- tabPanel(
  h5("Takeaways"),
  mainPanel(
    h1("Takeaways"),
    
    # Chart 1
    p("- Based on the Native Proportion chart, Minnesota and South Carolina 
      both have consistently high native percentages across all five categories. "),
    p("- Based on the Native Proportion chart, Hawaii has native species 
      percentages below 50% in every category except for fish."),
    
    # Chart 2
    p("- Browsing through the different unique orders, we can see from the chart that California consistently has some of the highest numbers
      of observered animals nearly every time. "),
    p("- From the unique orders chart, we can see there are many orders like Myxosporidia (a certain bacteria) and Synbranchiformes (an eel-like fish)
      that have only been observed at one national park."),
    
    # Chart 3
    p("The data-driven question we hope to answer from this map is: 
          which areas are experiencing biodiversity loss?"),
    p("This scatterplot describes either the number of endangered species, threatened species, 
          or species of concerns in each national park. On the plot, each dot with different colors
          represents various national parks. It is suggested that the number of endangered species
          ranges from 0-44, the number of threatened species ranges from 0-16, and the number of species
          of concern ranges from 21-177 in each national park."),
    
    # Chart 4
    p("- Based on the Conservation in the U.S. map, California has
      the highest number of species across all three categories of conversation:
      endangered, threatened, or concerned species"),
    p("- Based on the Conservation in the U.S. map,
      there is a higher proportion of species that are of concern."),
    
    # Conclusion
    h1("Conclusion"),
    p("Based on our findings, it is evident that biodiversity is being
      impacted negatively, which is why we should take action 
      to preserve biodiversity.")
    
  )
  
)

ui <- navbarPage(
  title = h1("Biodiversity Data Exploration"),
  theme = "styles.css",
  intro,
  page_one,
  page_two,
  page_three,
  page_four,
  takeaways
)
