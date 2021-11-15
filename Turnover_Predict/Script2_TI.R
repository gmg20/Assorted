library(ISLR)
library(caret)

io1_filt <- read_csv("io1_filt2.csv")
io1_filt<-io1_filt[,-c(1,3:4)]
io1_filt$TI2<-as.factor(io1_filt$TI2)
## Loading required package: lattice
## Loading required package: ggplot2
set.seed(300)
#Spliting data as training and test set. Using createDataPartition() function from caret
indxTrain <- createDataPartition(y = io1_filt$TI2,p = 0.75,list = FALSE)
training <- io1_filt[indxTrain,]
testing <- io1_filt[-indxTrain,]

#Checking distibution in origanl data and partitioned data
prop.table(table(training$TI2)) * 100
## 
##  Down    Up 
## 48.19 51.81
prop.table(table(testing$TI2)) * 100
## 
##  Down    Up 
## 48.08 51.92
prop.table(table(io1$TI2)) * 100
## 
##  Down    Up 
## 48.16 51.84


#Preprocessing
#kNN requires variables to be normalized or scaled. caret provides facility to preprocess data. I am going to choose centring and scaling

trainX <- training[,names(training) != "TI2"]
preProcValues <- preProcess(x = trainX,method = c("center", "scale"))
preProcValues
## 
## Call:
## preProcess.default(x = trainX, method = c("center", "scale"))
## 
## Created from 938 samples and 8 variables
## Pre-processing: centered, scaled
#Training and train control
set.seed(400)
ctrl <- trainControl(method="repeatedcv",repeats = 3) #,classProbs=TRUE,summaryFunction = twoClassSummary)
knnFit <- train(TI2 ~ ., data = training, method = "knn", trControl = ctrl, preProcess = c("center","scale"), tuneLength = 20)

#Output of kNN fit
knnFit

knnPredict <- predict(knnFit,newdata = testing)

#POSSIBLE ROC CURVE
knnPredict2<-as.numeric(knnPredict)
pr <- prediction(knnPredict2, testing$TI2)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc

#Get the confusion matrix to see accuracy value and other parameter values
confusionMatrix(knnPredict, testing$TI2,positive = "Quit" )

mean(knnPredict == testing$TI2)

ctrl <- trainControl(method="repeatedcv",repeats = 3,classProbs=TRUE,summaryFunction = twoClassSummary)
knnFit <- train(TI2 ~ ., data = training, method = "knn", trControl = ctrl, preProcess = c("center","scale"), tuneLength = 20)
knnFit

plot(knnFit, print.thres = 0.5, type="S")

knnPredict <- predict(knnFit,newdata = testing)
confusionMatrix(knnPredict, testing$TI2, positive="Quit" )

library(pROC)
knnPredict <- predict(knnFit,newdata = testing , type="prob")
knnROC <- roc(testing$TI2, knnPredict[, "Quit"], levels = rev(testing$TI2))
knnROC
