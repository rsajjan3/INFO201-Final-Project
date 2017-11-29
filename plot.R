library(dplyr)
natality.data <- read.csv('data.csv')
AgeTrend <- function(data) {
  wrangled.data <- group_by(data, Year, Age.of.Mother.Year) %>% summarise(births=sum(Births))
  return(wrangled.data)
}