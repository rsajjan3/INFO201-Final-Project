# map.R file that creates a map using the inputted data
# Created by Jason Chou

library(maps)

CreateMap <- function(map.data) {
  map.data$Births_cat <- gsub("NA", "0", map.data$Births_cat)
  plot <- map.data %>%
    group_by(group) %>%
    plot_ly(
            text = ~paste(County, paste("Births: ", births), sep = "<br />"), # Hover info
            x = ~long, 
            y = ~lat, 
            color = ~Births_cat, 
            colors = c('#f03b20', '#ffeda0') # Min and max colors for scale
            ) %>%
    add_polygons(line = list(width = 0.4)) %>%
    add_polygons(
                fillcolor = 'transparent',
                line = list(color = 'black', width = 0.5),
                showlegend = FALSE
                ) %>%
    layout(
            title = "Births per County<br />(Hover for more info)",
            titlefont = list(size = 10),
            xaxis = list(
                        title = "", 
                        showgrid = FALSE,
                        zeroline = FALSE, 
                        showticklabels = FALSE
                        ),
            yaxis = list(
                        title = "",
                        showgrid = FALSE,
                        zeroline = FALSE, 
                        showticklabels = FALSE
                        )
          )
}
