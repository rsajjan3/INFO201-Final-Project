# server. R file that defines the data that will be displayed through the UI

library("shiny")
library("dplyr")
library("plotly")

source("histogram.R")
source("map.R")
source("plot.R")

# Read in dataset
natality.data <- read.csv('data.csv')

shinyServer(function(input, output) {

  # CREATE HISTOGRAM
  output$histogram <- renderPlotly({  
    
    # Filter data by race values from checkbox widget
    
    
    # Filter data by year values from slider widget
    
    
    # Create the graph itself
    CreateHistogram()
    
  })
  
  
  
  # CREATE MAP
  output$map <- renderPlotly({  
    
    # Filter data by min/max values for number of births
    
    
    # Filter data by year values from slider widget
    
    
    # Create the map itself
    CreateMap()
    
  })
  
  
  
  # CREATE PLOT
  output$plot <- renderPlotly({  
    
    # Filter data by min/max values for age
    
    
    # Filter data by year values from slider widget
    
  
    # Create the plot itself
    CreatePlot()
    
  })
  
  
})