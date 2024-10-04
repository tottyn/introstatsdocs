
library(tidyverse)

voter <- read.csv("https://raw.githubusercontent.com/tottyn/introstatsdocs/refs/heads/main/data/voterturnout.csv")

voterclean <- voter %>%
  filter(voter$STATE != "United States") %>%
  select(YEAR, STATE, STATE_ABV, TOTAL_BALLOTS_COUNTED, VAP, VEP) %>%
  mutate_all(function(x) str_replace_all(x, ",", "")) %>%
  mutate(STATE = tolower(STATE)) %>%
  `colnames<-`(., c("year", "region", "abbreviation", "totalballots", "vap", "vep"))




