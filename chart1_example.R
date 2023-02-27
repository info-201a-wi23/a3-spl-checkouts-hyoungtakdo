library(dplyr)
library(ggplot2)
library(plotly)

my_data <- read.csv("C:/Users/hyoun/OneDrive/College 2022-2023/INFO 201/a3-spl-checkouts-hyoungtakdo/2022-2023-All-Checkouts-SPL-Data.csv/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# This will help us see either more physical or digital copies were checked out each month

physical_vs_digital <- my_data %>% group_by(UsageClass) %>% 
                                   filter(CheckoutYear =="2022") %>%
                                   summarise(Checkouts = sum(Checkouts))
                                   select(UsageClass, CheckoutMonth, Checkouts)

# The graph for the code above
ggplot(data = physical_vs_digital) +
  geom_point(mapping = aes(x = CheckoutMonth, y = Checkouts, color = UsageClass)) +
  labs(title = "Physical Vs Digital Checkout Per Month", x = "Checkout Month", y = "Number of Checkouts")

