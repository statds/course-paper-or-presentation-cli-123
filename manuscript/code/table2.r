avg_insurance_premium <- read.csv("premium_data.csv")
cat_insured_loss <- read.csv("cat_insured_loss.csv")
cost_of_cat <- read.csv("cost_of_cat.csv")

merged_data <- merge(cat_loss_data, premium_data, by = "year", all.x = TRUE)
merged_data <- merge(merged_data, cost_data, by = "year", all.x = TRUE)

panel_data <- as.data.frame(merged_data)
panel_data <- panel_data[complete.cases(panel_data), ]

model1 <- lm(log(premium) ~ log(loss), data = panel_data)
model2 <- lm(log(premium) ~ log(cost), data = panel_data)
model3 <- lm(log(premium) ~ log(loss), data = panel_data)

coef_table <- rbind(
  cbind(coef(model1), NA, NA),
  cbind(NA, coef(model2), NA),
  cbind(NA, NA, coef(model3))
)

summary(model1)
summary(model2)
summary(model3)

print(coef_table)