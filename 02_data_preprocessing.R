library(tidyverse)

listings_clean <- listings %>%
  filter(
    price > 0,
    minimum_nights > 0,
    availability_365 > 0
  ) %>%
  mutate(
    host_is_superhost = as.factor(host_is_superhost),
    room_type = as.factor(room_type),
    instant_bookable = as.factor(instant_bookable),
    price_clean = as.numeric(gsub("\\$", "", price))
  ) %>%
  drop_na(
    price_clean,
    accommodates,
    bedrooms,
    room_type,
    host_is_superhost,
    instant_bookable
  )

summary(listings_clean)
