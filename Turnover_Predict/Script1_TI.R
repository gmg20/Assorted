library(tidyverse)
library(readr)
library(readr)
library(ROCR)
library(caret)
library(tidyverse)
library(cvms)
library(DescTools)
library(class)

io1 <- read_csv("ProjectProspect/TI_Predict/IO_Level1_Data.csv")
io1<-io1[-1]

# Dichotomize TI into >3 Y/N
io1$TI2<-cut(io1$TI,  c(0,3,5), labels=c("NoQuit","Quit"))
io1<-io1 %>% relocate(TI2, .before = TI)
table(io1$TI2)
table(io1$code, io1$TI2)
hist(io1$TI)

# Eliminate non-key variables
io1<-io1[,-c(7:9)]
io1<-io1[,-8]

# Write to CSV
write.csv(io1, "io1_filt2.csv")

# Logistic Regression Model
m1 <- glm(TI2 ~ . - code - TI, data = io1, family = binomial(link="logit"))
summary(m1)
cbind(OR = coef(m1), confint(m1))
exp(cbind(OR = coef(m1), confint(m1)))

#Deviance
m1n<-glm(TI2 ~ 1, data = io1, family = binomial(link = "logit"))
anova(m1n, m1)

# Effect Size
PseudoR2(m1, "McFadden")
PseudoR2(m1, "Nagelkerke")
PseudoR2(m1, "Tjur")

### Adding in Test/Train Splits

# Split 
index = sample(nrow(io1), size = (nrow(io1)*.7), replace = FALSE)
io1_trn = io1[index,]
io1_test = io1[-index,]

# Remove TI continuous and Group Codes
io1_trn<-io1_trn[,-c(2:3)]
io1_test<-io1_test[,-c(2:3)]

# Fit model with train
m1trn = glm(TI2 ~ ., data=io1_trn, family = binomial(link='logit'))
summary(m1trn)

# Predict test data with model fitted on train
fitted.results <- predict(m1trn,newdata=io1_test,type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
misClasificError <- mean(fitted.results != io1_test$TI2)
print(paste('Accuracy',1-misClasificError))

# ROC/AUC
p <- predict(m1trn, newdata=io1_test, type="response")
pr <- prediction(p, io1_test$TI2)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc

# Confusion Matrix
fitted.results <- predict(m1trn,newdata=io1_test, type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
fitted.results<-as.factor(fitted.results)
misClasificError <- mean(fitted.results != io1_test$TI2)
print(paste('Accuracy',1-misClasificError))

#METHOD A
d <- tibble("target" = io1_test$TI2, "prediction" = fitted.results)
basic_d<-table(d)
cfm <- as_tibble(basic_d)
plot_confusion_matrix(cfm, 
                      target_col = "target", 
                      prediction_col = "prediction",
                      counts_col = "n")
# METHOD B
conf_mat <- confusion_matrix(targets = d$target,predictions = d$prediction)
plot_confusion_matrix(
  conf_mat$`Confusion Matrix`[[1]],
  font_counts = font(
    size = 3,
    angle = 360,
    color = "red"
  ),
  add_sums = TRUE,
  sums_settings = sum_tile_settings(
    palette = "Oranges",
    label = "Total",
    tc_tile_border_color = "black"
  )
)
