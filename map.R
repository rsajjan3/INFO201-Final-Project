# map.R file that creates a map using the inputted data
# Created by Jason Chou

library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(maps)
natality.data <- read.csv('data.csv')
## Read in data

wash <- map_data("county") %>%
  filter(region == 'washington')
## Washington State county latitute and longtitude

colnames(wash)[6] <- "County"
## Make the column name to County so that later can join with map.data

WA_births <- natality.data %>%   
  ## Begin with the original dataset
  
  filter(Year.Code == 2011) %>%
  
  ## Filter data by year values from slider widget
  
  group_by(County) %>% summarise(births=sum(Births)) %>%
  ## Group by county, and sum births for each county
  
  filter(births >= 0, births <= 30000)
## Filter data by min/max values for number of births

WA_births$County <- tolower(gsub(" County, WA","", WA_births$County))
## lower case the county name

WA_births <- filter(WA_births, County %in% c("benton", "clark", "cowlitz", "king", "kitsap", "pierce", "skagit", "snohomish", "spokane", "thurston", "whatcom", "yakima"))
## Delete the unidentity county

map.data <- full_join(wash, WA_births, by = "County")

CreateMap <- function(map.data) {
  map.data$Births_cat <- cut(map.data$births, breaks = c(seq(0, 25000, by = 1)), labels=1:25000)
  plot <- map.data %>%
    group_by(group) %>%
    plot_ly(
      x = ~long, 
      y = ~lat, 
      color = ~Births_cat, 
      colors = c('#ffeda0','#f03b20'),
      text = ~paste(paste(County), paste("Births:", births), sep = "<br />"),
      hoverinfo = 'text')  %>%
    add_polygons(line = list(width = 0.4)) %>%
    add_polygons(
      fillcolor = 'transparent',
      line = list(color = 'black', width = 0.5),
      showlegend = FALSE, hoverinfo = 'none'
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
