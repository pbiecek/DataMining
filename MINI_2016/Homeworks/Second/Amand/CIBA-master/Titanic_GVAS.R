library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(neuralnet)
library(e1071)
library(caret)
library(randomForest)
library(party)
library(caret)

#Settingt the Directory and loading the Rdata ~ For everytime use

setwd("C:/Users/shankar/Desktop")
load('.RData')

#Loading Data - Following the routine, since its a small dataset
train<-read.csv('train.csv')
test<- read.csv('test.csv')

#Combining the data so as to manipulate and set to right format
test$Survived<-NA
combi<-rbind(train,test)

#Extracting the information from Names to predict missing ages
combi$Name <- as.character(combi$Name)
strsplit(combi$Name[1], split='[,.]')
strsplit(combi$Name[1], split='[,.]')[[1]]
strsplit(combi$Name[1], split='[,.]')[[1]][2]
combi$Title <- sapply(combi$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][2]})
combi$Title <- sub(' ', '', combi$Title)
combi$Title[combi$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Mr'
combi$Title[combi$Title %in% c('Col','Dr','Jonkheer','Rev')] <- 'Mr'
combi$Title[combi$Title %in% c('the Countess','Mme','Dona','Lady')] <- 'Mrs'
combi$Title[combi$Title %in% c('Mlle')] <- 'Miss'
combi$Fare[is.na(combi$Fare)] <- mean(combi$Fare, na.rm=TRUE)
combi$FamId<- combi$SibSp+ combi$Parch 

#Predicting NAs of Age

for (i in 1:1309) {
  if(is.na(combi$Age[i])){
    if(combi$Title[i]=="Master"){combi$Age[i]<-sample(1:17,1)}
    else if(combi$Title[i]=="Mr"){combi$Age[i]<-sample(18:50,1)}
    else if(combi$Title[i]=="Miss"){combi$Age[i]<-sample(18:29,1)}
    else if(combi$Title[i]=="Mrs"){combi$Age[i]<-sample(30:60,1)}
    else{combi$Age[i]<-sample(18:60,1)}
  }
}

#Predicting the errors in Fares
for(i in 1:1309){
  if(combi$Fare[i]<7 && combi$Pclass[i]==1){combi$Fare[i]<-50}
  else if(combi$Fare[i]<7 && combi$Pclass[i]==2){combi$Fare[i]<-13}
  else if(combi$Fare[i]<7 && combi$Pclass[i]==3){combi$Fare[i]<-7}
  else{combi$Fare[i]<-combi$Fare[i]}
}

#Splitting back the train and test data
train <- combi[1:891,]
test <- combi[892:1309,]

#Factoring the required sets
factor(train$Sex, c("male", "female"), labels = c(1, 0))
factor(test$Sex, c("male", "female"), labels = c(1, 0))
factor(train$Embarked, c("C", "Q","S"), labels = c(1, 2,3))
factor(test$Embarked, c("C", "Q","S"), labels = c(1, 2,3))

#------------Model fitting Starts here-------------------------------#

#Applying Decision trees
fit <- rpart(Survived ~ Sex + Age + FamId + Pclass + Fare , data = train, method="class")
fancyRpartPlot(fit)

final_result4 <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = final_result4)
write.csv(submit, file = "treesubmission5.csv", row.names = FALSE)




#Applying Neural network
m <- model.matrix( ~ Survived + Pclass + Sex + Age + SibSp + Parch + Fare, data = train)
net <- neuralnet(Survived ~ Sexmale + Age + Pclass + SibSp + Parch, data=m, hidden = 10, threshold = 0.1)
plot(net)

test_temp<-subset(test,select=c("Pclass","Sex","Age","SibSp","Parch","Fare"))
factor(test_temp$Sex, c("male", "female"), labels = c(1, 0))
n <- model.matrix( ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = test_temp)
prediction<-compute(net, n[,2:6])

for(i in 1:length(prediction$net.result)){
  if(prediction$net.result[i]>0.6){prediction$net.result[i]<-1}
  else{prediction$net.result[i]<-0}
}
submit2 <- data.frame(PassengerId = test$PassengerId,Survived = prediction$net.result)
write.csv(submit2, file = "neuralnet.csv", row.names = FALSE)


#SVM modelling
plot(train$Age, train$Pclass, xlab="Age", ylab="Pclass", col=ifelse(train$Survived==1, "red", "blue"))
pairs(~Age+Sex+Pclass+Fare+SibSp+Parch,data=train, col=ifelse(train$Survived==1, "red", "blue"))

train_svm<-train[,c("Age","Sex","Pclass","SibSp","Parch","Survived")]
svm.model<-svm(Survived ~ . , data = train_svm, kernel="radial")

test_svm<-test[,c("Age","Sex","Pclass","SibSp","Parch")]
test_svm$Fare[is.na(test_svm$Fare)] <- mean(test_svm$Fare, na.rm=TRUE)
preds<-predict(svm.model, test_svm)

for(i in 1:length(preds)){
  if(preds[i]>0.5){preds[i]<-1}
  else{preds[i]<-0}
}

submit9 <- data.frame(PassengerId = test$PassengerId, Survived = preds)
write.csv(submit9, file = "svm_subP.csv", row.names = FALSE)

#Final Model - Random Forests
set.seed(415)
fit2<- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + Fare + Embarked + FamId + Parch + SibSp, data=train, importance=TRUE, ntree=2000)
varImpPlot(fit)

test$Pred_rf <- predict(fit2, test)
submit11 <- data.frame(PassengerId = test$PassengerId, Survived = test$Pred_rf)
write.csv(submit11, file = "forest2.csv", row.names = FALSE)



#C- forest
set.seed(415)
fit <- cforest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + FamId, data = train, controls=cforest_unbiased(ntree=2000, mtry=3))

Pred_cf <- predict(fit, test, OOB=TRUE, type = "response")
submit12 <- data.frame(PassengerId = test$PassengerId, Survived = Pred_cf)
write.csv(submit12, file = "forest2.csv", row.names = FALSE)