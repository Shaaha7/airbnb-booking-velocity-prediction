dt_results <- confusionMatrix(dt_pred, test$Is_Good)
glm_results <- confusionMatrix(glm_pred, test$Is_Good)

data.frame(
  Model = c("Decision Tree", "Logistic Regression"),
  Accuracy = c(dt_results$overall["Accuracy"],
               glm_results$overall["Accuracy"]),
  Sensitivity = c(dt_results$byClass["Sensitivity"],
                  glm_results$byClass["Sensitivity"]),
  Specificity = c(dt_results$byClass["Specificity"],
                  glm_results$byClass["Specificity"])
)
