CreatePlot <- function(data) {
  #Split data into quartiles
  data$quartile <- ntile(data$births, 4)
  plott <- plot_ly(data, x=data$Year, y=data$Age.of.Mother.Year, type='scatter', mode='markers',
                   #Multiple by 10 to make bubbles larger
                   marker=list(size=data$quartile*10),
                   text = ~sprintf("%s <br /> Age of mothers: %s <br /> Births: %s <br />", data$Year, data$Age.of.Mother.Year, data$births)) %>% 
    layout(xaxis = list(title = 'Year', dtick=1), yaxis = list(title = 'Age of Mother')
    )
  return(plott)
}