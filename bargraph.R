# histogram.R file that creates a bar graph using the inputted data
# Created by Seungju Choi

# Since we are trying to categorize x-axis as a Race(Nonnumeric Value), we could not use Histogram.
# So, we changed our plan to use 'BarGraph' 

library(plotly)

# Function that creates bargraph to visualize the given data
CreateBarGraph <- function(data) {
  
  # X-axis is categorized as Race and Y-axis is amount of Births
  # Colorize each Race as a different color
  bar <- plot_ly(data, x= data$Race, y= data$births, type = 'bar', color = data$Race) %>% 
                      
                      # Creates the main title for this bargraph
                      layout(title = "Number of Births in Each Race for Given Range of Years", 
                             
                             # Creates the title for X-axis and Y-axis that has maximum limit of 100,000
                             xaxis = list(title = 'Race'), yaxis = list(range = c(0, 100000), title = 'Number of Birth'))
               
  return(bar)
}

