# Create map.R file 
# Jason Chou
install.packages('plotly')
library(dplyr)
library(plotly)
library(ggplot2)
# Create Maps
devtools::install_github('ropensci/plotly')

# geo styling
geo.style <- list(scope = 'Washington State', 
                  projection = list(type = 'albers usa'), 
                  showland = TRUE, landcolor = toRGB("gray95"), 
                  subunitcolor = toRGB("gray85"), 
                  countrycolor = toRGB("gray85"), 
                  countrywidth = 0.5, 
                  subunitwidth = 0.5)

# Structuring plot for the shootings
plot <- plot_geo(shootings.2017, lat = ~lat, lon= ~lng) %>%
  add_markers(
    text = ~paste(paste("(", lng, ",", lat, ")"), paste(city, ",", state), paste("People Injured:", injured), paste("People Killed:", killed), sep = "<br />"),
    color = ~injured, colors = c("lightblue", "purple"), size = ~killed, hoverinfo = "text") %>%
  layout(title = "2017 United States shootings<br />(Hover for more info)",geo = geo.style)
