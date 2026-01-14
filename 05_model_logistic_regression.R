glm_model <- glm(
  Is_Good ~ .,
  data = train,
  family = binomial
)

glm_probs <- predict(glm_model, test, type = "response")

glm_pred <- ifelse(glm_probs > 0.5, "Good", "Bad")
glm_pred <- as.factor(glm_pred)

confusionMatrix(glm_pred, test$Is_Good)
