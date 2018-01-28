library(dplyr)

process_data <- function() {
  punishment_rate_df <- read.csv("data/punishment_rate.csv", stringsAsFactors = FALSE)
  
  punishment_rate_df <- punishment_rate_df %>%
    select(-c(Punishment.rank, Imprisonment.rank)) 
  
  colnames(punishment_rate_df)[c(2,3)] <- c("Punishment_Rate", "Imprisonment_Rate")
  
  return(punishment_rate_df)
}
