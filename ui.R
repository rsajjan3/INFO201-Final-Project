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
                            
                            
                            tags$h1("Welcome!"),
                            tags$div("Greetings! Thank you for using the 'Natality in Washington State' application.
                                    The intention of this application is to provide our audience with a simple yet effective means to explore data.
                                    The data in question concerns natality, information regarding births and the mothers who give birth.
                                    For simplicity's sake, the data collected is only from Washington State.
                                    Use the headers at the top of the page to navigate from visulaization to visualization. 
                                    The currently implimented visualizations include: a bar graph, a map, and a plot."),
                            tags$hr(),                            
                            
                            
                            tags$h1("About the Dataset"),
                            tags$div("The data used in the creation of this application is natality (birth rate) data gathered by the CDC.
                                    It majorly focuses on birthmothers, including basic information such as their race, age, and so on. 
                                    We have limited the data to Washington state during the five year period from 2011 to 2015, inclusively.
                                    The data can be found on the Centers for Disease Control Wonder at the link below:"),
                            tags$a(href="https://wonder.cdc.gov/natality-current.html", "https://wonder.cdc.gov/natality-current.html"),
                            tags$hr(),
                            
                            
                            tags$h1("About Our Audience"),
                            tags$div("Whether you be friend or researcher, mother or other, this application was designed with you in mind.
                                    It is intended to be a simple and informative method of investigating natality data.
                                    Our target audience are people concerned with information regarding births and birth mothers in WA. 
                                    This could be individuals, such as soon-to-be mothers who want to know the most common location to give birth,  
                                    or how many other women of her age gave birth in a specific county, 
                                    as well as organizations such as Planned Parenthood who want to know where to place specific clinic locations,
                                    or what kind of programs to run where."),
                            tags$hr(),
                            
                            
                            tags$h1("About Us"),
                            tags$div("This application was created by Group AB1, which consisted of four Informatics students at the University of Washington: Matthew Choi, Jason Chou, Ravi Sajjan, & Megan Tucker. 
                                    We are UW students who took Mike Freeman's INFO 201 class during Autumn of 2017. 
                                    During that class, we learned the necessary R Studio, Shiny, and data manipulation skills in order to create this application.
                                    We thank you for using our app. Our GitHub and code can be found at the link below:"),
                            tags$a(href="https://github.com/tuckemeg000/AB1-Final-Project", "https://github.com/tuckemeg000/AB1-Final-Project"),
                            tags$br(),
                            tags$br()
                            
                    ),
                   
                   tabPanel("Births per Mothers' Race",
                            
                            tags$h1("Births per Mothers' Race"),
                            tags$div("Below is a bar graph that visualizes the number of births organized by race of the baby's mother.
                                    Different colors are used for each race.
                                    (Please note that data was only provided for the three most common races.)
                                    Manipulate this bar graph using the widgets below to explore the race of birth mothers over the five year period.
                                    You may select and unselect the different race groups as well as choose which year's data should be shown.
                                    Questions to ponder are below:"),
                            tags$ul(
                              tags$li("What is the most common race among birth mothers?"), 
                              tags$li("Does the ranking of highest to lowest races stay consistant from year to year?"), 
                              tags$li("How does the number of births per race change from year to year?")
                            ),
                            tags$hr(),
                            
                            
                            # Race Checkbox Widget for Bar Chart
                            checkboxGroupInput("B.check.race", 
                                               label = h3("Choose race(s):"), 
                                               choices = list(
                                                 "Cacuasian" = "White", 
                                                 "African America" = "Black or African American", 
                                                 "Asian or Pacific Islander" = "Asian or Pacific Islander"),
                                               selected = c("White", "Black or African American", "Asian or Pacific Islander")
                            ),
                            
                            # Year Slider Widget for Bar Chart
                            sliderInput("B.slider.year", 
                                        label = h3("Specify year range:"), 
                                        min = 2011,
                                        max = 2015,
                                        value = c(2011,2012)
                            ),
                            
                            
                            # Call method to print Bar Graph
                            plotlyOutput("bar")
                            
                    ),
                   
                   tabPanel("Births per County",
                            
                            tags$h1("Births per County"),
                            tags$div("Below is a map that visualizes the number of births in each county of Wasington State.
                                    A darker color implies larger birth rates, and vice versa.
                                    Manipulate this map using the widgets below to explore the number of births in each WA county over a period from 2011 to 2015. 
                                    You may filter the max and min of number of births as well as choose which year's data to be shown.
                                    Questions to ponder are below:"),
                            tags$ul(
                              tags$li("Which county has the highest birthrate over this time period?"),
                              tags$li("Over the years, does the birth rate in Washington generally go up or down?"),
                              tags$li("Is there any correlation between the counties and the birth rate?")
                            ),
                            tags$hr(),
                            
                            # Births Slider Widget for Map
                            sliderInput("M.slider.birth", 
                                        label = h3("Specify number of births range:"), 
                                        min = 0,
                                        max = 130000,
                                        value = c(0, 130000)
                            ),
                            
                            # Year Slider Widget for Map
                            sliderInput("M.slider.year", 
                                        label = h3("Specify year range:"), 
                                        min = 2011,
                                        max = 2015,
                                        value = c(2011,2011)
                            ),                           
                            
                            # Call method to print map
                            plotlyOutput("map")
                            
                    ),
                   
                   tabPanel("Age of Birthmothers in King County",
                            
                            tags$h1("Age of Birthmothers in King County"),
                            tags$div("Below is a plot that visualizes the ages of birthmothers in King County.
                                    (Again, the data pool has been shrunk to ensure ease of exploration.)
                                    Larger points imply more instances of birthmothers of that age, and vice versa.
                                    Manipulate this plot using the widgets below to explore the ages of mothers over the time period between 2011 to 2015. 
                                    You may filter the max and min ages as well as choose which year's data to be shown.
                                    Questions to ponder are below:"),
                            tags$ul(
                              tags$li("What is the most common age for birthmothers?"), 
                              tags$li("How does the range of age of birthmothers change from year to year?"), 
                              tags$li("Are teen birth rates increasing or decreasing over this time period?")
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