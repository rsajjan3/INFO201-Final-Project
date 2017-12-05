# map.R file that creates a map using the inputted data
# Created by Jason Chou

library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(maps)



#wash_births$Births_cat <- cut(wash_births$Births, breaks = c(seq(0, 10000, by = 500)), labels=1:20)



CreateMap <- function(map.data) {
  plot <- map.data %>%
    group_by(group) %>%
    plot_ly(
      x = ~long, 
      y = ~lat, 
      color = ~Births, 
      colors = c('#ffeda0','#f03b20'),
      text = ~paste(paste(County), paste("Births:", Births), sep = "<br />"),
      hoverinfo = 'text')  %>%
    add_polygons(line = list(width = 0.4)) %>%
    layout(
      title = "2011~2015 Washington States Birth Rate<br />(Hover for more info)",
      titlefont = list(size = 10),
      xaxis = list(title = "", showgrid = FALSE,
                   zeroline = FALSE, showticklabels = FALSE),
      yaxis = list(title = "", showgrid = FALSE,
                   zeroline = FALSE, showticklabels = FALSE)
    )
}
