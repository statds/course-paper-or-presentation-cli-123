library(dplyr)

premium_data <- read.csv("premium_data.csv")
disaster_data <- read.csv("disasters_data.csv")

summary_stats_premium <- premium_data %>%
  summarize(
    mean_premium = mean(premium, na.rm = TRUE),
    sd_premium = sd(premium, na.rm = TRUE),
    min_premium = min(premium, na.rm = TRUE),
    max_premium = max(premium, na.rm = TRUE)
  )

summary_stats_disaster <- disaster_data %>%
  summarize(
    mean_disaster = mean(disaster),
    sd_disaster = sd(disaster),
    min_disaster = min(disaster),
    max_disaster = max(disaster)
  )

combined_summary_stats <- list(
  Premium = summary_stats_premium,
  Disaster = summary_stats_disaster
)

print(combined_summary_stats)

