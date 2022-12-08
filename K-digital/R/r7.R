indf<-read.csv('C:/Users/user/Desktop/016_/week16/5/insurance.csv')
str(indf)
summary(indf)
hist(indf$expenses)
install.packages('moments')
library(moments)
skewness(indf$expenses) # 왜도
# skew>0 : mode<median<mean, skew<0 : mean<median<mode
kurtosis(indf$expenses) # 첨도도
# 첨도는 0인 것이 좋다

table(indf$region)
cor(indf[c('age','bmi','children','expenses')])

# 특징 간 관계 시각화 : 산포도 행렬

pairs(indf[c('age','bmi','children','expenses')])

# scatter plot -> more informative
install.packages('psych')
library(psych)
pairs.panels(indf[c('age','bmi','children','expenses')])

#lm : linear regression / ~ : 틸드 종속변수 ~ 독립변수
#ins_model<-lm(expenses ~ age+children+bmi+sex+smoker+region, data = indf)
ins_model<-lm(expenses ~ . , data = indf)

# 모델 성능 평가
summary(ins_model)

# 모델 성능 개선
# 비선형 관계 추가
indf$age2<-indf$age^2
# bmi > 30 이면 1, 아니면 0 (이진화)
indf$bmi30<-ifelse(indf$bmi>=30,1,0)
ins_model2<-lm(expenses~age+age2+children+bmi+sex+bmi30*smoker+region,
               data = indf)

summary(ins_model2)


indf$pred<-predict(ins_model2, indf)
cor(indf$pred, indf$expenses)
plot(indf$pred, indf$expenses)
abline(a=0, b=1, col='red', lwd=3, lty=2)

predict(ins_model2, data.frame(age = 30, age2 = 30^2, children = 2,
                               bmi = 30, sex = 'male', bmi30 = 1,
                               smoker = 'no', region ='northeast'))

tree<-c(1,1,1,2,2,3,4,5,5,6,6,7,7,7,7)
at1<-c(1,1,1,2,2,3,4,5,5)
at2<-c(6,6,7,7,7,7)
bt1<-c(1,1,1,2,2,3,4)
bt2<-c(5,5,6,6,7,7,7,7)
sdr_a<-sd(tree) - (length(at1) / length(tree) * sd(at1) + length(at2) / length(tree) * sd(at2))

sdr_b<-sd(tree) - (length(bt1) / length(tree) * sd(bt1) + length(bt2) / length(tree) * sd(bt2))
sdr_a
sdr_b

wine<-read.csv('C:/Users/user/Desktop/016_/week16/5/whitewines.csv')
str(wine)
hist(wine$quality)
summary(wine)

wine_train<-wine[1:3750,]
wine_test<-wine[3751:4898,]
install.packages('rpart')
library(rpart)

m.rpart<-rpart(quality ~. , data = wine_train)
summary(m.rpart)

# 트리의 시각화
install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(m.rpart, digits = 3)
rpart.plot(m.rpart, digits = 4, fallen.leaves = TRUE, type = 3, extra = 101)

p.rpart<-predict(m.rpart, wine_test)
summary(p.rpart)
summary(wine_test, quality)

# 예측된 품질 값과 실제 품질 값 사이에 상관관계 측정
cor(p.rpart, wine_test$quality)

# 평균 절대 오차 (MAE, mean, absolute error)
MAE<-function(actual, predicted){
  mean(abs(actual-predicted))
}
MAE(p.rpart, wine_test$quality)
mean(wine_train$quality)
MAE(5.87, wine_test$quality)
