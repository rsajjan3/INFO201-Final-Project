# bargraph.R file that creates a bar graph using the inputted data
# Created by Seungju Choi

# Since we are trying to categorize x-axis as a Race(Nonnumeric Value), we could not use Histogram.
# So, we changed our plan to use 'BarGraph' 

CreateBarGraph <- function(data) {
  
  # X-axis is categorized as Race and Y-axis is amount of Births
  # Colorize each Race as a different color
  bar <- plot_ly(data, 
                 x = data$Race, 
                 y = data$births, 
                 type = 'bar', 
                 color = data$Race#,
                 #p+scale_fill_manual(values=c("#f03b20", "#E69F00", "#56B4E9"))
                 ) %>% 
                      
          layout(title = "Number of Births in Each Race for Given Range of Years", 
                xaxis = list(title = 'Race'), 
                yaxis = list(range = c(0, 100000))
                )
               
  return(bar)
}

