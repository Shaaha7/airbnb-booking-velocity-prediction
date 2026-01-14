model_data <- listings_clean %>%
  select(
    Is_Good,
    room_type,
    accommodates,
    bedrooms,
    price_clean,
    host_is_superhost,
    instant_bookable,
    minimum_nights
  )

model_data$Is_Good <- as.factor(model_data$Is_Good)
