Using `caret` package:
  ```{r}
model.rf <- train(test ~ ., pima,
                  method = "rf", ntree = 10,
                  trControl = train.param)

names(pima) <- make.names(names(pima),unique = TRUE,allow_ = FALSE)

model.svm <- train(test ~ ., pima,
                   method = "svmRadial", .sigma = .02, .C = .9,
                   trControl = train.param)

class.real <- pima$test # real / actual class
class.pred <- predict(model.svm, pre_processed_pima, type = "raw") # predicted class
scoring    <- predict(model.svm, pre_processed_pima, type = "prob")[, "yes"] # predicted class probability

```