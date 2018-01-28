library(dplyr)
library(ggplot2)
library(ggalt)

punishment_rate_df <- read.csv("data/punishment_rate.csv", stringsAsFactors = FALSE)

punishment_rate_df %>%
  select(-c(Punishment.rank, Imprisonment.rank)) %>%
  rename(Punishment_Rate = X2013.punishment.rate, Imprisonment_Rate = X2013.imprisonment.rate) ->
  punishment_rate_df

punishment_rate_df %>%
  ggplot(aes(x = Punishment_Rate, xend = Imprisonment_Rate, y = State)) +
  geom_dumbbell()