# plot.R file that creates a plot using the inputted data
# Created by Ravi Sajjan

CreatePlot <- function(data) {
  #Split data into quartiles
  data$quartile <- ntile(data$births, 4)
  plott <- plot_ly(data, 
                   x=data$Year, 
                   y=data$Age.of.Mother.Year, 
                   type='scatter', 
                   mode='markers',
                   marker=list(size=data$quartile*10), #Multiple by 10 to make bubbles larger
                   color= '#ffeda0',
                   text = ~sprintf("%s <br /> Age of mothers: %s <br /> Births: %s <br />", data$Year, data$Age.of.Mother.Year, data$births)) %>% 
    layout(title = "Age of Birthmothers in King County<br />(Hover for more info)", 
           xaxis = list(title = 'Year', dtick=1), 
           yaxis = list(title = 'Age of Mother')
    )
  return(plott)
}