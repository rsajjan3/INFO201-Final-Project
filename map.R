# map.R file that creates a map using the inputted data
# Created by Jason Chou

library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(maps)

natality.data <- read.csv('data.csv')
BirthsPerCounty <- function(data) {
  wrangled.data <- group_by(data, County) %>% summarise(births=sum(Births))
  return(wrangled.data)
}

wash <- map_data("county") %>%
  filter(region == 'washington')

births <- natality.data %>%
  group_by(County) %>%
  summarise(Births = sum(Births))

births$County <- tolower(gsub(" County, WA","", births$County))

births <-filter(births, County %in% c("benton", "clark", "cowlitz", "king", "kitsap", "pierce", "skagit", "snohomish", "spokane", "thurston", "whatcom", "yakima"))
     
colnames(wash)[6] <- "County"
            
wash_births <- full_join(wash, births, by = "County")

wash_births$Births_cat <- cut(wash_births$Births, breaks = c(seq(0, 10000, by = 500)), labels=1:20)

plot <- wash_births %>%
  group_by(group) %>%
  plot_ly(
          x = ~long, 
          y = ~lat, 
          color = ~Births_cat, 
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


