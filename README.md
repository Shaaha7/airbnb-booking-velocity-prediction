# airbnb-booking-velocity-prediction
Airbnb listing success prediction using a custom Booking Velocity Index, built with R.
# Airbnb Listing Success Prediction using Booking Velocity Index (R)

## Overview
This project predicts whether an Airbnb listing is likely to be **high-performing ("Good")** or **low-performing ("Bad")** based on a custom **Booking Velocity Index**.

Instead of relying on historical ratings or reviews alone, this project introduces a **velocity-based success metric** that captures how quickly a listing converts available nights into bookings — a concept inspired by **hospitality revenue management and Airbnb search ranking behavior**.

---

## Problem Statement
Airbnb prioritizes listings that book quickly, as fast booking signals strong market demand and increases platform revenue.  
However, traditional metrics like ratings reflect **past satisfaction**, not **current booking performance**.

This project addresses that gap by:
- Designing a **Booking Velocity Index**
- Classifying listings into **Good vs Bad**
- Building machine learning models to predict listing success

---

## Dataset
Airbnb open dataset consisting of:
- `listings.csv` – listing, pricing, host, and availability details  
- `reviews.csv` – guest reviews  
- `neighbourhoods.csv` – location metadata  

Total listings analyzed: **~57,000**

---

## Booking Velocity Index (Target Variable Engineering)
Since direct booking counts are unavailable, bookings are approximated using an industry assumption:
> **1 review ≈ 2 bookings**

### Calculation Steps:
1. `Bookings per month = (number_of_reviews × 2) / months_active`
2. `Available nights per month = availability_365 / 12`
3. `Booking Velocity = bookings_per_month / available_nights_per_month`
4. Normalize velocity to a **0–100 score**
5. Top **35%** listings classified as **“Good”**, remaining as **“Bad”**

This approach emphasizes **real-time demand** rather than historical feedback.

---

## Data Preprocessing
- Missing value removal and imputation  
- Data type conversion  
- Invalid and zero-value filtering  
- Outlier handling (winsorization)  
- Feature threshold enforcement  

---

## Feature Set
The following features were selected based on business logic and data quality:

- `room_type`
- `accommodates`
- `bedrooms`
- `price_clean`
- `host_is_superhost`
- `instant_bookable`
- `minimum_nights`

These features capture **property configuration, pricing strategy, and booking convenience**.

---

## Models Implemented
Two classification models were built and compared:

### 1. Decision Tree
- Rule-based and interpretable  
- Captures non-linear relationships  
- Useful for explaining decisions to non-technical stakeholders  

### 2. Logistic Regression
- Probability-based classification  
- Interpretable coefficients  
- Suitable for baseline and business explainability  

---

## Model Evaluation
Evaluation metrics:
- Accuracy
- Sensitivity
- Specificity
- Balanced Accuracy

### Results Summary

| Model                | Accuracy | Sensitivity | Specificity |
|---------------------|----------|-------------|-------------|
| Decision Tree       | 69.05%   | 28.97%      | 91.24%      |
| Logistic Regression | 68.87%   | 32.11%      | 89.22%      |

---

## Key Insights
- **High booking velocity strongly correlates with listing success**
- **Superhosts** achieve faster bookings due to trust and algorithmic visibility
- **Entire homes** outperform shared and private rooms
- **Lower minimum nights** increase booking speed
- **Competitive pricing** improves listing performance

---

## Business Impact
This model can be used to:
- Identify high-potential listings early
- Support host pricing and availability decisions
- Improve Airbnb search ranking strategies
- Power host dashboards and automated pricing systems

---

## Future Improvements
- Add review sentiment analysis
- Include photo count and listing description quality
- Incorporate seasonality and time-based trends
- Experiment with advanced models such as Gradient Boosting (XGBoost)

---

## Tools & Technologies
- R
- tidyverse
- caret
- rpart
- ggplot2

---

## Project Structure
