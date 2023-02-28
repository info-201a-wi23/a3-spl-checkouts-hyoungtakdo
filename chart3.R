library(dplyr)
library(ggplot2)
library(plotly)

my_data <- read.csv("C:/Users/hyoun/OneDrive/College 2022-2023/INFO 201/a3-spl-checkouts-hyoungtakdo/2022-2023-All-Checkouts-SPL-Data.csv/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

month_data <- my_data %>% group_by(CheckoutMonth) %>%
                          filter(CheckoutYear == "2022") %>%
                          summarise(Checkouts = sum(Checkouts))

avg_month_plot <- ggplot(data = month_data) +
  geom_col(mapping = aes(x = CheckoutMonth,
                           y = Checkouts,
                           fill = Checkouts,
                           text = paste("Monthly Checkouts:", Checkouts, 
                           sep = "\n", "Month Number:", CheckoutMonth))) +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Library Checkout Per Month Data", 
       x = "Checkout Month", 
       y = "Number of Checkouts",
       fill = "Checkout Points")

ggplotly(avg_month_plot, tooltip = c("text"))  
