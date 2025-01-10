
# load the needed package
library(tidyverse)



# copy (Ctrl+C) a station id from all unique options
# you'll use it to filter the data later
# you shouldn't select the same station as any other classmate
unique(mswd$STATION)



# view a snippet of the data and check for missing values
# make note of the name, coordinates, and elevation of the station
mswd %>%
  filter(STATION == "US1MANF0019") %>%
  head()



# create a line graph of snowfall over time for a single station
mswd %>%
  filter(STATION == "US1MANF0019") %>%
  ggplot(aes(x = DATE, y = SNOWFALL)) +
  geom_line()



# create a line graph of precipitation over time for that same station
mswd %>%
  filter(STATION == "US1MANF0019") %>%
  ggplot(aes(x = DATE, y = PRECIPITATION)) +
  geom_line()



# create a line graph of maximum and minimum temperatures over time for that same station
mswd %>%
  filter(STATION == "US1MANF0019") %>%
  ggplot() +
  geom_line(aes(x = DATE, y = MAXTEMP), color = "red") +
  geom_line(aes(x = DATE, y = MINTEMP), color = "blue")

# if the majority of data are missing change to a different station and run your code again









