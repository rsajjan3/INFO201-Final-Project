# server.R file that defines the data that will be displayed through the UI
# Created by Megan Tucker

library("shiny")
library("dplyr")
library("plotly")

source("bargraph.R")
source("map.R")
source("plot.R")

# Read in dataset
natality.data <- read.csv('data.csv')

shinyServer(function(input, output) {
  
  # CREATE BAR GRAPH
  output$bar <- renderPlotly({  
    
    # Wrangle original dataset to desired histogram data
    bar.data <- filter(natality.data, County == 'King County, WA') %>% 
    ## Filter out all but King County data
    
    filter(Year >= input$B.slider.year[1], Year <= input$B.slider.year[2]) %>% 
    ## Filter data by year values from slider widget
    
    group_by(Race) %>% summarise(births = sum(Births)) %>% 
    ## Group by race, and sum births for each race
    
    filter(Race %in% input$B.check.race)
    ## Filter data by race values from checkbox widget
    
    # Create the graph itself
    bar <- CreateBarGraph(bar.data)
    
  })
  
  
  
  # CREATE MAP
  output$map <- renderPlotly({  
    
    natality.data <- read.csv('data.csv')
    ## Read in data
    
    wash <- map_data("county") %>%
            filter(region == 'washington')
    ## Washington State county latitute and longtitude
    
    colnames(wash)[6] <- "County"
    ## Make the column name to County so that later can join with map.data
    
    WA_births <- natality.data %>%   
    ## Begin with the original dataset
    
    filter(Year.Code >= input$M.slider.year[1], Year.Code <= input$M.slider.year[2]) %>%
      
    ## Filter data by year values from slider widget
    
    group_by(County) %>% summarise(births=sum(Births)) %>%
    ## Group by county, and sum births for each county
    
    filter(births >= input$M.slider.birth[1], births <= input$M.slider.birth[2])
    ## Filter data by min/max values for number of births
    
    WA_births$County <- tolower(gsub(" County, WA","", WA_births$County))
    ## lower case the county name
    
    WA_births <- filter(WA_births, County %in% c("benton", "clark", "cowlitz", "king", "kitsap", "pierce", "skagit", "snohomish", "spokane", "thurston", "whatcom", "yakima"))
    ## Delete the unidentity county
    
    map.data <- full_join(wash, WA_births, by = "County")
    ## Join two data frame
    
    map.data$Births_cat <- cut(map.data$births, breaks = c(seq(0, 130000, by = 1)), labels=1:130000)
    ## Break data into regions/categories
    
    # Create the map itself
    map <- CreateMap(map.data)
    
  })
  
  
  
  # CREATE PLOT
  output$plot <- renderPlotly({  
    plot.data <- natality.data
    plot.data$Age.of.Mother.Year <- gsub(" years", "", plot.data$Age.of.Mother.Year)
    ## Begin with original dataset
    
    plot.data <- group_by(plot.data, Year, Age.of.Mother.Year) %>% summarise(births=sum(Births)) %>%
    ## Group by both year and mother age, and sum birth for each Year/Age pair
    
    filter(as.numeric(Age.of.Mother.Year) >= input$P.slider.age[1], as.numeric(Age.of.Mother.Year) <= input$P.slider.age[2]) %>%
    ## Filter data by min/max values for age
    
    filter(Year >= input$P.slider.year[1], Year <= input$P.slider.year[2])
    ## Filter data by year values from slider widget
    # Create the plot itself
    plot <- CreatePlot(plot.data)
  })
  
  
  
})