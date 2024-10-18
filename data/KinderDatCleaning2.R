
library(tidyverse)

kinder2018 <- read.csv("https://raw.githubusercontent.com/tottyn/introstatsdocs/refs/heads/main/data/kinder2018fin.csv")
kinder2020 <- read.csv("https://raw.githubusercontent.com/tottyn/introstatsdocs/refs/heads/main/data/kinder2020fin.csv")

kindercountall <- merge(kinder2018, kinder2020)
write.csv(kindercountall, "kindercountall.csv", row.names = F)
