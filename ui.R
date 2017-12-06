# ui.R file that defines how the application will be displayed in the browser
# Created by Megan Tucker

library("shiny")
library("dplyr")
library("markdown")
library("ggplot2")
library("plotly")
library("tidyverse")


shinyUI(navbarPage("Natality in Washington State",
                   
                   tabPanel("About",
                            
                            tags$img(src = "https://cdn7.dissolve.com/p/D1312_2_238/D1312_2_238_0004_600.jpg"),
                            
                            
                            tags$h1("This Application"),
                            tags$div("The intention of this application is to provide our audience with a simple yet effective way to explore data.
                                     Use the headers at the top of the page to navigate from visulaization to visualization.
                                     The currently implimented visualizations include: Bar Graph, Map, and Plot."),
                            tags$hr(),                            
                            
                            tags$h1("The Dataset"),
                            tags$div("The data used in the creation of this is natality (birth rate) data gathered by the CDC.
                                    It majorly focuses on birthmothers, including basic information such as their race, age, and so on. 
                                    We have limited the data to Washington state during the five year period from 2011 to 2015 for simplicity's sake.
                                    The data can be found on the Centers for Disease Control Wonder at the following link:"),
                            tags$a(href="https://wonder.cdc.gov/natality-current.html", "https://wonder.cdc.gov/natality-current.html"),
                            tags$hr(),
                            
                            tags$h1("Our Audience"),
                            tags$div("Whether you be friend or researcher, mother or other, this application was designed with you in mind.
                                    It was designed to be a simple and informative method of investigating natality data.
                                    Our target audience are people concerned with information regarding births and birth mothers in WA. 
                                    This could be individuals, such as soon-to-be mothers who want to know the most common location to give birth  
                                    or how many other women of her age gave birth in a specific county, 
                                    as well as organizations such as Planned Parenthood who want to know where to place specific clinic locations
                                    or what kind of programs to run where."),
                            tags$hr(),
                            
                            tags$h1("Us"),
                            tags$div("This application was created by Group AB1, which consisted of four Informatics students at the University of Washington: Matthew Choi, Jason Chou, Ravi Sajjan, & Megan Tucker. 
                                    We are UW students who took Mike Freeman's INFO 201 class during Autumn of 2017. 
                                    During that class, we learned the necessary R Studio, Shiny, and data manipulation skills in order to create this application.")

                    ),
                   
                   tabPanel("Bar Chart",
                            
                            tags$h1("Bar Chart"),
                            tags$div("Manipulate this bar chart using the widgets below to explore the race of birth mothers over the five year period.
                                     You may select and unselect the different race groups as well as choose which year's data should be shown.
                                     Questions to ponder are below:"),
                            tags$ul(
                              tags$li("First list item"), 
                              tags$li("Second list item"), 
                              tags$li("Third list item")
                            ),
                            tags$hr(),
                            
                            
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
                            
                            tags$h1("Map"),
                            tags$div("Manipulate this map using the widgets below to explore the number of births in each WA county over period from 2011 to 2015. 
                                    You may filter the max and min of number of births as well as choose which year's data to be shown.
                                    Questions to ponder are below:"),
                            tags$ul(
                              tags$li("First list item"), 
                              tags$li("Second list item"), 
                              tags$li("Third list item")
                            ),
                            tags$hr(),
                            
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
                            
                            tags$h1("Plot"),
                            tags$div("Manipulate this plot using the widgets below to explore the ages of mothers over the time period between 2011 to 2015. 
                                    You may filter the max and min ages as well as choose which year's data to be shown.
                                    Questions to ponder are below:"),
                            tags$ul(
                              tags$li("First list item"), 
                              tags$li("Second list item"), 
                              tags$li("Third list item")
                            ),
                            tags$hr(),
                            
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