library(caret)
library(rpart)
library(rpart.plot)

set.seed(123)

train_index <- createDataPartition(model_data$Is_Good, p = 0.8, list = FALSE)
train <- model_data[train_index, ]
test <- model_data[-train_index, ]

dt_model <- rpart(
  Is_Good ~ .,
  data = train,
  method = "class"
)

rpart.plot(dt_model)

dt_pred <- predict(dt_model, test, type = "class")

confusionMatrix(dt_pred, test$Is_Good)
