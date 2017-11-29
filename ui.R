# ui.R file that defines how the application will be displayed in the browser
# Created by Megan Tucker
library("shiny")
library("dplyr")
library("markdown")


shinyUI(navbarPage("Natality in Washington State",
                   tabPanel("About"
                            # Print paragraph regarding this project
                            # Print paragraph regarding the dataset
                            ),
                   tabPanel("Histogram"
                            # Call method to print histogram
                            ## Check boxes widget to mainpulate displayed races
                            ),
                   tabPanel("Map"
                            # Call menthod to print map
                            ## Range slider widget to mainuplate number of birth min/max
                            ),
                   tabPanel("Plot"
                            # Call method to print plot
                            ## Check boxes widget to manipulate ______
                            )
))