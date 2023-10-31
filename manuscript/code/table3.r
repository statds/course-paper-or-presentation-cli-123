avg_insurance_premium <- read.csv("premium_data.csv")
severe_storm_cost <- read.csv("severe_storm_time_series.csv")
flooding_cost <- read.csv("flooding_time_series.csv") 
wildfire_cost <- read.csv("wildfire_time_series.csv")  
cost_of_cat <- read.csv("cost_of_cat.csv")

data <- merge(avg_insurance_premium, severe_storm_cost, by = "year")
data <- merge(data, flooding_cost, by = "year")
data <- merge(data, wildfire_cost, by = "year")
data <- merge(data, cost_of_cat, by = "year")

data$log_premium <- log(data$premium)
data$log_severe_storm_cost <- log(data$severe_storm_cost)
data$log_flooding_cost <- log(data$flooding_cost)
data$log_wildfire_cost <- log(data$wildfire_Cost)

model_severe_storm <- lm(log_premium ~ log_severe_storm_cost, data = data)
model_flood <- lm(log_premium ~ log_flooding_cost, data = data)
model_wildfire <- lm(log_premium ~ log_wildfire_cost, data = data)

coef_severe_storm <- coef(model_severe_storm)
coef_flood <- coef(model_flood)
coef_wildfire <- coef(model_wildfire)

coef_table <- matrix(NA, nrow = 3, ncol = 3)

coef_table[1, 1] <- coef_severe_storm[2]  
coef_table[2, 2] <- coef_flood[2]  
coef_table[3, 3] <- coef_wildfire[2]  

print(coef_table)
