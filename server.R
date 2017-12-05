# server.R file that defines the data that will be displayed through the UI
# Created by Megan Tucker

library("shiny")
library("dplyr")
library("plotly")

source("histogram.R")
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
    
    map.data <- natality.data %>%   
    ## Begin with the original dataset
    
    filter(Year >= input$M.slider.year[1], Year <= input$M.slider.year[2]) %>%
    ## Filter data by year values from slider widget
    
    group_by(County) %>% summarise(births=sum(Births)) %>%
    ## Group by county, and sum births for each county
    
    filter(Births >= input$M.slider.birth[1], Births <= input$M.slider.birth[2])
    ## Filter data by min/max values for number of births
    
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