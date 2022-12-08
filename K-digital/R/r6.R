curve(-x*log2(x)-(1-x)*log2(1-x),
      col = 'red', xlab ='x', ylab = 'Entropy', lwd = 4)

credit<-read.csv('C:/Users/user/Desktop/016_/week16/4/credit.csv')
str(credit)
table(credit$checking_balance)
table(credit$savings_balance)

summary(credit$months_loan_duration)
summary(credit$amount)

table(credit$default)

set.seed(123)
train_sample<-sample(1000, 900)
train_sample
credit_train<-credit[train_sample,]
credit_test<-credit[-train_sample,]

prop.table(table(credit_train$default))
prop.table(table(credit_test$default))

install.packages('C50')
library(C50)
credit_train$default<-as.factor(credit_train$default)
credit_model<-C5.0(credit_train[-17], credit_train$default)
credit_model<-predict(credit_model, credit_test)

library('gmodels')
CrossTable(credit_test$default, credit_model, prop.chisq = FALSE,
           prop.c = FALSE, prop.t = FALSE, dnn = c('actual defalut', 
                                                   'predicted default'))

credit_boost<-C5.0(credit_train[-17], credit_train$default)
credit_boost<-predict(credit_boost, credit_test)
CrossTable(credit_test$default, credit_boost, prop.chisq = FALSE,
           prop.c = FALSE, prop.t = FALSE, dnn = c('actual defalut', 
                                                   'predicted default'))

mushrooms<-read.csv('C:/Users/user/Desktop/016_/week16/4/mushrooms.csv', stringsAsFactors = TRUE)
str(mushrooms)
str(mushrooms$veil_color)
mushrooms$veil_color<-NULL
table(mushrooms$type)
install.packages('OneR')
library(OneR)
mushrooms_1R<-OneR(type~., data=mushrooms)
mushrooms_1R

mushrooms_1R_pred<-predict(mushrooms_1R, mushrooms)
table(actual = mushrooms$type, predcited = mushrooms_1R_pred)

#install.packages('RWeka')
#install.packages('rJava')
#library(RWeka)

