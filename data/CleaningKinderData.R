
# load packages
library(tidyverse)

# read in data
kinder <- read.csv("kinder.csv")

# kindergarten enrollment for all student groups for each district/year pair
allkinderclean <- kinder %>%
  select(SY, DIST_NAME, STUGROUP_CODE, KGR_STUGROUP_CNT) %>%
  group_by(DIST_NAME, STUGROUP_CODE, SY) %>%
  summarize(kindercount = sum(KGR_STUGROUP_CNT)) %>%
  filter(STUGROUP_CODE == "All Students") %>%
  ungroup() %>%
  select(-STUGROUP_CODE)

# which districts have years 2018-2023 all included?
keepdist <- allkinderclean %>%
  group_by(DIST_NAME) %>%
  count() %>%
  filter(n == 6) %>%
  select(DIST_NAME) %>%
  flatten_chr()

# keep only those districts
allkinder <- allkinderclean %>%
  filter(DIST_NAME %in% keepdist)

write.csv(allkinder, "kinder.csv", row.names = FALSE)















