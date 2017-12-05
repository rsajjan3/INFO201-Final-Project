# ui.R file that defines how the application will be displayed in the browser
# Created by Megan Tucker

library("shiny")
library("dplyr")
library("markdown")
library("ggplot2")
library("plotly")
library("tidyverse")


shinyUI(navbarPage("Natality in Washington State",
                   
                   tabPanel("About"
                            # Print paragraph regarding this project
                            # Print paragraph regarding the dataset
                    ),
                   
                   tabPanel("Bar Chart",
                            
                            # Race Checkbox Widget for Bar Chart
                            checkboxGroupInput("B.check.race", 
                                               label = h3("Choose race(s):"), 
                                               choices = list(
                                                 "Cacuasian" = "White", 
                                                 "African America" = "Black or African American", 
                                                 "Asian or Pacific Islander" = "Asian or Pacific Islander"),
                                               selected = "White"
                            ),
                            
                            # Year Slider Widget for Bar Chart
                            sliderInput("B.slider.year", 
                                        label = h3("Specify year range:"), 
                                        min = 2011,
                                        max = 2015,
                                        value = c(2011,2015)
                            ),
                            
                            
                            # Call method to print Bar Graph
                            plotlyOutput("bar")
                            
                    ),
                   
                   tabPanel("Map",
                            
                            # Births Slider Widget for Map
                            sliderInput("M.slider.birth", 
                                        label = h3("Specify number of births range:"), 
                                        min = 2000,
                                        max = 30000,
                                        value = c(2000,10000)
                                        
                                        # TODO: CHANGE VALUES WHEN DATA IS ANALYZED
                                        
                            ),
                            
                            # Year Slider Widget for Map
                            sliderInput("M.slider.year", 
                                        label = h3("Specify year range:"), 
                                        min = 2011,
                                        max = 2015,
                                        value = c(2011,2015)
                            ),                           
                            
                            # Call method to print map
                            plotlyOutput("map")
                            
                    ),
                   
                   tabPanel("Plot",
                            
                            # Year Slider Widget for Plot
                            sliderInput("P.slider.year", 
                                        label = h3("Specify year range:"), 
                                        min = 2011,
                                        max = 2015,
                                        value = c(2011,2015)
                            ),
                            
                            
                            # Age Slider Widget for Plot
                            sliderInput("P.slider.age", 
                                        label = h3("Specify mother age range:"), 
                                        min = 0,
                                        max = 50,
                                        value = c(25,35)
                            ),
                            
                            # Call method to print plot
                            plotlyOutput("plot")
                            
                            )
))