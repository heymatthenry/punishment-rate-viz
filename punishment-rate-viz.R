library(dplyr)
library(ggplot2)
library(ggalt)

punishment_rate_df <- read.csv("data/punishment_rate.csv", stringsAsFactors = FALSE)

punishment_rate_df %>%
  select(-c(Punishment.rank, Imprisonment.rank)) %>%
  rename(Punishment_Rate = X2013.punishment.rate, 
         Imprisonment_Rate = X2013.imprisonment.rate) %>%
  arrange(desc(Punishment_Rate)) -> 
  punishment_rate_df

gg <- ggplot(
            data = punishment_rate_df,
            aes(x = Punishment_Rate, 
                xend = Imprisonment_Rate, 
                y = reorder(State, Punishment_Rate)))
# Colors -----------------#
# Lighter green : #B8EBD7 #
# Darker green  : #43BBBF #
# Lighter red   : #FE3755 #
# Darker red    : #C2054C #
# Dark gray     : #3E4545 #
# ------------------------#
gg <- gg + geom_dumbbell(
            colour = "#3E4545",
            colour_x = "#C2054C",
            colour_xend = "#43BBBF")
gg <- gg + theme(axis.ticks = element_blank())
gg