# Create a histogram for given data
# Created by Seungju Choi
library(dplyr)
library(plotly)

CreateHistogram <- function(data) {
  histogram <- plot_ly(data, x= data$Race, y= data$Births, type = 'histogram', 
                      
                      # Hovering information on the Histogram
                      # text = ~paste0("Race:", Race, '<br>Births: ', Births, '<br>Year: ', Year),
                      ### ^ There is an error on this line because the object "Births" cannot be found
                      
                      # Colorize each race
                      color = data$Race, size = data$Births) %>% 
                      
                      layout(xaxis = list(title = 'Race'), yaxis = list(title = 'Amount of Birth')
                      )
               
  return(histogram)
}

