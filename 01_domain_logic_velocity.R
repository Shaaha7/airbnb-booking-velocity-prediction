library(tidyverse)
library(lubridate)

# Calculate months active (approximation)
listings <- listings %>%
  mutate(
    months_active = pmax(1, availability_365 / 30)
  )

# Booking velocity calculation
listings <- listings %>%
  mutate(
    bookings_per_month = (number_of_reviews * 2) / months_active,
    available_per_month = availability_365 / 12,
    booking_velocity = bookings_per_month / available_per_month
  )

# Normalize velocity score (0–100)
max_velocity <- max(listings$booking_velocity, na.rm = TRUE)

listings <- listings %>%
  mutate(
    velocity_score = (booking_velocity / max_velocity) * 100
  )

# Top 35% classification
threshold <- quantile(listings$velocity_score, 0.65, na.rm = TRUE)

listings <- listings %>%
  mutate(
    Is_Good = ifelse(velocity_score >= threshold, "Good", "Bad")
  )

table(listings$Is_Good)
