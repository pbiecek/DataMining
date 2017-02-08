# source: https://www.analyticsvidhya.com/blog/2015/08/learning-concept-knn-algorithms-programming/
#https://rstudio-pubs-static.s3.amazonaws.com/123438_3b9052ed40ec4cd2854b72d1aa154df9.html
library("ggplot2")

#library("knn")
#library("caret")
library(caret)
library(class)

math_student <- student_mat

gc.math_student <- math_student

str(math_student)





ggplot(math_student, aes(y=walc, x=studytime)) +
  geom_point() +
  theme_bw() + coord_fixed()



math_student<-read.table("student-mat.csv", header=TRUE, sep=";", stringsAsFactors = FALSE)
math_student





set.seed(1313)
Indx_Train_Math <- createDataPartition(y = math_student$Walc, p = 0.75)
str(Train_Math)

math_student_train <- math_student[Indx_Train_Math$Resample1,]
math_student_test <- math_student[-Indx_Train_Math$Resample1,]
math_student_train
math_student_test



knnFit1 <- knn3(Walc ~ studytime+failures, data = math_student_train, k=1)
knnFit5 <- knn3(Walc ~ studytime+failures, data = math_student_train, k=5)
knnFit20 <- knn3(Walc ~ studytime+failures, data = math_student_train, k=20)
pred1 <- predict(knnFit1, math_student_test, type="class")




tab <- table(true = math_student_test$Walc, predicted = pred1)
tab
tab2 <- prop.table(tab, 1)
tab2

sum(diag(tab)) / sum(tab)
sum(diag(tab2)) / sum(tab2)







tuneK <- 1:100
performance <- sapply(tuneK, function(k) {
  knnFit <- knn3(Walc ~ studytime+failures, data = math_student_train, k=k)
  tab <- table(true = math_student_test$Walc,
               predict = predict(knnFit, math_student_test, type="class"))
  sum(diag(tab)) / sum(tab)
}) 
performance

df <- data.frame(tuneK, performance)

ggplot(df, aes(tuneK, performance)) +
  geom_point() + 
  geom_smooth(se=FALSE, span=0.1, size=2) +
  theme_bw()






#__________________
#ANOTHER APPROACH


library("ggplot2")

#library("knn")
#library("caret")
library(caret)
library(class)



gc.math_student <- math_student

str(math_student)





ggplot(math_student, aes(y=Walc, x=traveltime)) +
  geom_point() +
  theme_bw() + coord_fixed()



math_student<-read.table("student-mat.csv", header=TRUE, sep=";", stringsAsFactors = FALSE)
math_student


num.vars <- sapply(math_student, is.numeric)
math_student[num.vars] <- lapply(math_student[num.vars], scale)

#how traveltime study time and failures affects on drinking alcohol
#myvars <- c("traveltime", "studytime", "failures")
myvars <- c("Walc")
math_student.subset <- math_student[myvars]


math_train <- math_student.subset[1:95,]
math_test <- math_student.subset[96:396,]


math_student_train <- math_student_n[1:95,]
math_student_test <- math_student_n[96:396,]


math_student_train
math_train
math_test

summary(math_student.subset)


#APPROACH WITH KNN

#Sepal Length, Sepal Width, Petal Length and Petal Width.
knn.1 <-  knn(math_train, math_test, train.def, k=1)
knn.5 <-  knn(math_train, math_test, train.def, k=5)
knn.20 <- knn(math_train, math_test, train.def, k=20)


#here I've chosen 1 predictor -> studytime, how it affects on drinking alcohol during weekends

#lhs ~ rhs where lhs is the response variable and rhs a set of predictors.


normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

math_student_n <- as.data.frame(lapply(math_student[13:15], normalize))
summary(math_student_n$radius)





knnFit <- knn3(Walc ~ studytime, data = math_train, k=1)
pred <- predict(knnFit, math_test, type="class")


#knn_result <- knn3(Species ~ Sepal.Length+Sepal.Width, data = iris, k=5, prob=TRUE)
#knn_result
 
# plot(train.gc[,c("amount","duration")],
#      col=c(4,3,6,2)[gc.bkup[-test, "installment"]],
#      pch=c(1,2)[as.numeric(train.def)],
#      main="Predicted Default, by 1 Nearest Neighbors",cex.main=.95)
# 
# points(test.gc[,c("amount","duration")],
#        bg=c(4,3,6,2)[gc.bkup[-test,"installment"]],
#        pch=c(21,24)[as.numeric(knn.1)],cex=1.2,col=grey(.7))
# 
# legend("bottomright",pch=c(1,16,2,17),bg=c(1,1,1,1),
#        legend=c("data 0","pred 0","data 1","pred 1"),
#        title="default",bty="n",cex=.8)
# 
# legend("topleft",fill=c(4,3,6,2),legend=c(1,2,3,4),
#        title="installment %", horiz=TRUE,bty="n",col=grey(.7),cex=.8)

###########


# 
# x <- cbind(x_train,y_train)
# # Fitting model
# fit <-knn(y_train ~ ., data = x,k=5)
# summary(fit)
# 
# #Predict Output 
# predicted= predict(fit,x_test)

#iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)

