# Create a histogram for given data
# Seungju Choi
library(dplyr)
natality.data <- read.csv('data.csv')
RaceDistrubtion <- function(data) {
  wrangled.data <- filter(data, County =='King County, WA') %>% group_by(Race) %>% summarise(births=sum(Births))
  return(wrangled.data)
}