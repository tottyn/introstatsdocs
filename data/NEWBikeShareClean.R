#
library(tidyverse)
library(geosphere)
library(NISTunits)

# read in data
bikeshare <- read.csv("bikedat_jan_2025.csv")

# calculate duration of bikeride
bikeshare$duration <- difftime(as.POSIXct(bikeshare$ended_at, format = "%Y-%m-%d %H:%M:%OS"), 
                               as.POSIXct(bikeshare$started_at, format = "%Y-%m-%d %H:%M:%OS"),
                               units = "mins") %>% as.numeric()

# calculate distance 
bikeshare$distance <- with(bikeshare, acos((sin(NISTdegTOradian(start_lat)) * sin(NISTdegTOradian(end_lat))) + 
                                             (cos(NISTdegTOradian(start_lat)) * cos(NISTdegTOradian(end_lat))) * 
                                             (cos(NISTdegTOradian(end_lng) - NISTdegTOradian(start_lng))))*6371)

# some are NA but really zero distance
bikeshare$distance[is.na(bikeshare$distance)] <- 0

# select variables of interest
bikesharedone <- bikeshare %>% select(rideable_type, member_casual, duration, distance)

# save cleaned dataset
write.csv(bikesharedone, "jan25bikeshare.csv", row.names = FALSE)
