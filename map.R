# map.R file that creates a map using the inputted data
# Created by Jason Chou

library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(maps)

CreateMap <- function(map.data) {
  map.data$Births_cat <- gsub("NA", "0", map.data$Births_cat)
  plot <- map.data %>%
    group_by(group) %>%
    plot_ly(
      text = ~paste(County, paste("Births: ", births), sep = "<br />"),
      x = ~long, 
      y = ~lat, 
      color = ~Births_cat, 
      colors = c('#ffeda0','#f03b20')
      ) %>%
    add_polygons(line = list(width = 0.4)) %>%
    add_polygons(
      fillcolor = 'transparent',
      line = list(color = 'black', width = 0.5),
      showlegend = FALSE
    ) %>%
    layout(
      title = "Washington States Birth Rate<br />(Hover for more info)",
      titlefont = list(size = 10),
      xaxis = list(title = "", showgrid = FALSE,
                   zeroline = FALSE, showticklabels = FALSE),
      yaxis = list(title = "", showgrid = FALSE,
                   zeroline = FALSE, showticklabels = FALSE)
    )
}
