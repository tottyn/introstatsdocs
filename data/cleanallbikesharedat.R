
#
library(tidyverse)

#
bikeshare <- read.csv("bikeshare.csv")

#
bikeshare[which(bikeshare$StartDate != bikeshare$EndDate), ] <- NA

#
bikeshare <- na.omit(bikeshare)

#
sum(bikeshare$StartDate != bikeshare$EndDate)

#
bikeshare$Duration <- difftime(as.POSIXct(bikeshare$EndTime, format = "%H:%M:%S"), 
                               as.POSIXct(bikeshare$StartTime, format = "%H:%M:%S"),
                               units = "mins") %>% as.numeric()

# 
bikeshare[,which(colnames(bikeshare) %in% 
                   c("RouteID", "StartLongitude", "StartLatitude", "EndLatitude", "EndLongitude",
                     "EndDate", "EndTime", "StartDate", "StartTime"))] <- NULL

#

write.csv(bikeshare, "bikeshareclean.csv", row.names = FALSE)






