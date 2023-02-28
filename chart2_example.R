library(dplyr)
library(ggplot2)
library(plotly)

my_data <- read.csv("C:/Users/hyoun/OneDrive/College 2022-2023/INFO 201/a3-spl-checkouts-hyoungtakdo/2022-2023-All-Checkouts-SPL-Data.csv/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

seuss_data <- my_data %>% filter(Creator == "Seuss, Dr.") %>%
                          filter(CheckoutYear == "2022") %>%
                          group_by(Title, CheckoutMonth) %>%
                          summarise(Checkouts = sum(Checkouts)) %>%
                          filter(Title %in% c("Dr. Seuss's ABC.", 
                                             "Dr. Seuss's sleep book.",
                                             "Fox in socks / by Dr. Seuss.",
                                             "Happy birthday to you! By Dr. Seuss."))


seuss_plot <- ggplot(data = seuss_data) +
  geom_line(mapping = aes(
    x = CheckoutMonth, 
    y = Checkouts,
    color = Title))  +
  geom_point(mapping = aes(
    x = CheckoutMonth, 
    y = Checkouts,
    color = Title,
    text = paste("Monthly Checkouts:", Checkouts, 
                 sep = "\n", "Month Number:", CheckoutMonth))) +
  labs(title = "Seuss Book Checkouts Per Month", 
       x = "Checkout Month", 
       y = "Number of Checkouts",
       color = "Seuss Books")

ggplotly(seuss_plot, tooltip = c("text"))
