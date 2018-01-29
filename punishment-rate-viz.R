library(dplyr)
library(ggplot2)
library(ggalt)

pr_df <- read.csv("data/punishment_rate.csv", stringsAsFactors = FALSE)

pr_df %>%
  select(-c(Punishment.rank, Imprisonment.rank)) %>%
  rename(Punishment_Rate = X2013.punishment.rate, 
         Imprisonment_Rate = X2013.imprisonment.rate) %>%
  arrange(desc(Punishment_Rate)) -> 
  pr_df

gg <- ggplot(
            data = pr_df,
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
PR_color  <- "#FE3755"
IR_color  <- "#43BBBF"
bar_color <- ifelse((pr_df["Punishment_Rate"] > pr_df["Imprisonment_Rate"]), 
                    PR_color, IR_color)
gg <- gg + geom_dumbbell(
            colour = bar_color,
            colour_x = PR_color,
            colour_xend = IR_color,
            size = 1.5)
gg <- gg + labs(y = NULL, 
                x = "Imprisonment Rate and Punishment Rate (2013)",
                title = "Difference between imprisonment rate and punishment rate")
gg <- gg + theme(plot.title = element_text(hjust = 0.5))
gg <- gg + theme(axis.ticks = element_blank())
gg