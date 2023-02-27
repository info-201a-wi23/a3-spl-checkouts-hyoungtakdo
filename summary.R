my_data <- read.csv("C:/Users/hyoun/OneDrive/College 2022-2023/INFO 201/a3-spl-checkouts-hyoungtakdo/2022-2023-All-Checkouts-SPL-Data.csv/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

library(dplyr) 

# This will find the most checked out material type/category of item from the library

most_category <- my_data %>% group_by(MaterialType) %>% 
                             summarise(Checkouts = sum(Checkouts)) %>%
                             filter(Checkouts == max(Checkouts)) %>%
                             pull(MaterialType)

# This will find which book had the highest amount of checkouts

highest_count_book <- my_data %>% filter(MaterialType == "BOOK") %>% 
                                 group_by(Title) %>%
                                 summarise(Checkouts = sum(Checkouts)) %>%
                                 filter(Checkouts == max(Checkouts)) %>%
                                 pull(Title)

# This will find the average amount of physical things were checked out each month

physical_avg_month <- my_data %>% filter(UsageClass == "Physical") %>%
                                  summarise(Checkouts = sum(Checkouts) / 12) %>%
                                  pull(Checkouts)

# This will find the average amount of Dr. Seuss related items are checked out each month

seuss_avg_month <- my_data %>% filter(Creator == "Seuss, Dr.") %>% 
                               summarise(Checkouts = sum(Checkouts) / 12) %>%
                               pull(Checkouts)

# This will find the most checkouts under a publishers name

most_publish_checkout <- my_data %>% group_by(Publisher) %>%
                                     summarise(Checkouts = sum(Checkouts)) %>%
                                     filter(Checkouts == max(Checkouts)) %>%
                                     pull(Publisher)

