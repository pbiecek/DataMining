---
title: "7th_homework"
author: "Margareta Kusan"
date: "November 26, 2015"
output: html_document
---

#Loading data 
```{r}
data <- read.table("train.csv", sep=",", head=T)
head(data, 50)
```

#Making new dataset 
```{r}
data2 <- data[0:20000,]
data3 <- data[0:20000,]

data2 %>% 
  group_by(VisitNumber) %>%
  summarise(num_of_products = sum(ScanCount),
            day = unique(Weekday), 
            TripType = unique(TripType),
            returned = sum(ScanCount < 0),
            different_categories = sum(unique(FinelineNumber)>0, na.rm = TRUE)) %>%
  
head(data2, 50)

library(tidyr)
#detach("package:plyr", unload=TRUE) 
data3 <- data3 %>%  
  group_by(TripType, VisitNumber, DepartmentDescription) %>%
  summarise(count = n())  %>%
  spread(DepartmentDescription, count, fill=0) 
  
head(data3, 50)

data4 = merge(data2, data3)
head(data4, 50)

colnames(data4) <- make.names(colnames(data4)) 

data4$TripType = factor(data4$TripType)
```

#Splitting the dataset
```{r}
library(caret)
indxTrain <- createDataPartition(y = data4$TripType, p = 0.75)
str(indxTrain)

data4Train <- data4[indxTrain$Resample1,]
data4Test <- data4[-indxTrain$Resample1,]
```

#Random forest
```{r}
library(randomForest)
ffit <- randomForest(factor(TripType) ~ .,   data=data4Train, importance = TRUE)
print(ffit)

importance(ffit)
varImpPlot(ffit)

scores <- predict(ffit, data4Test, type="prob")
head(scores)

myScores <- sapply(1:nrow(data4Test), function(i){
  scores[i, as.character(data4Test$TripType[i])]
})

mean(-log(pmax(myScores,0.05)))
```

#using important features
```{r}
ffit <- randomForest(factor(TripType) ~ num_of_products+different_categories+VisitNumber,   data=data4Train, importance = TRUE)
print(ffit)

scores <- predict(ffit, data4Test, type="prob")
head(scores)

myScores <- sapply(1:nrow(data4Test), function(i){
  scores[i, as.character(data4Test$TripType[i])]
})

mean(-log(pmax(myScores,0.05)))
```


#KNN 
```{r}
knnFit <- knn3(TripType ~ ., data = data4Train, k=20, prob=TRUE)
scores <- predict(knnFit, data4Test, type="prob")
head(scores)

myScores <- sapply(1:nrow(data4Test), function(i){
  scores[i, as.character(data4Test$TripType[i])]
})

mean(-log(pmax(myScores,0.05)))
```

#KNN with important features
```{r}
knnFit <- knn3(TripType ~ num_of_products+different_categories+VisitNumber, data = data4Train, k=20, prob=TRUE)
scores <- predict(knnFit, data4Test, type="prob")
head(scores)

myScores <- sapply(1:nrow(data4Test), function(i){
  scores[i, as.character(data4Test$TripType[i])]
})

mean(-log(pmax(myScores,0.05)))
```

