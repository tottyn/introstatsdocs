# load the needed package
library(tidyverse)

# read in the dataset
mswd <- read.csv("https://raw.githubusercontent.com/tottyn/introstatsdocs/refs/heads/main/data/MiddlesexWeatherDataALL.csv") 

# data from weather stations in Middlesex County, MA for each day
# in 2024 obtained from https://www.ncdc.noaa.gov/cdo-web/search

# determine which stations have less than 2% of data missing for 2024
keepstation <- mswd %>%
  mutate(anyna = apply(., 1, function(x) anyNA(x))) %>%
  group_by(STATION) %>%
  summarize(count = n(), propwithmissing = sum(anyna)/n()) %>%
  arrange(propwithmissing) %>%
  filter(propwithmissing < 0.05 & count > 360) %>%
  select(STATION) %>%
  flatten_chr()

# filter to just those stations
mswdsmall <- mswd %>% filter(STATION %in% keepstation)

# format dates correctly
mswdsmall$DATE <- as.Date(mswdsmall$DATE, "%m/%d/%y")

# double check
mswdsmall %>%
  mutate(anyna = apply(., 1, function(x) anyNA(x))) %>%
  group_by(STATION) %>%
  summarize(propwithmissing = sum(anyna)/366) %>%
  arrange(propwithmissing) %>%
  View()

# save cleaned data 
write.csv(mswdsmall, "MiddlesexWeatherData.csv", row.names = FALSE)


