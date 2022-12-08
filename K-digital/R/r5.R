wbcd<-read.csv('C:/Users/user/Desktop/016_/week16/3/data.csv')
str(wbcd)
# 마이너스 부호 활용시 특정 행 or 열을 제외한 데이터 추출 가능.
wbcd<-wbcd[-1]
table(wbcd$diagnosis)
#R 머신러닝 분류기는 목표 특징이 팩터로 코딩이 되어야함.
wbcd$diagnosis<-factor(wbcd$diagnosis, levels = c('B', 'M'), labels = c('Benign','Malignant'))
round(prop.table(table(wbcd$diagnosis))*100, digit = 1)
summary(wbcd[c('radius_mean', 'area_mean', 'smoothness_mean')])
# 수치를 통일화 해줘야 하기 때문에 정규화를 실시.
# 특징을 정규화하고자 R에서 normalize()함수를 사용
normalize<-function(x){
  return( (x-min(x) ) / ( max(x) - min(x) ) )
}
normalize(c(1,2,3,4,5))
normalize(c(10,20,30,40,50))
wbcd_n<-as.data.frame(lapply(wbcd[2:31], normalize))
wbcd_n
wbcd_train<-wbcd_n[1:469,]
wbcd_test<-wbcd_n[470:569,]

#label을 split
wbcd_train_labels<-wbcd[1:469, 1]
wbcd_test_labels<-wbcd[470:569, 1]

install.packages('class')
library(class)
# p<-KNN(train,test,class,k)
# train : 수치 훈련 데이터를 포함하는 데이터 프레임
# test : 수치 테스트 데이터를 포함하는 데이터 프레임
# class : 훈련 데이터의 각 행에 대한 클래스를 갖는 팩터 벡터
# k : 최근접 이웃의 개수를 가리키는 정수.

wbcd_test_pred<-knn(train = wbcd_train, test=wbcd_test, cl = wbcd_train_labels, k = 21)
wbcd_test_pred

#모델 성능 평가 -> crosstable
install.packages('gmodels')
library(gmodels)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)
# 카이제곱(chi-square) : 하나 이상의 범주에서 관측된 빈도가 기대빈도와 일치하는지를 하는 것.

# 모델 성능 개선 시도
# z-score 표준화
# 암 데이터셋에서는 z-점수 표준화가 특징을 재조정하는 좀 더 적절한 방법이 될 수 있다.

wbcd_z<-as.data.frame(scale(wbcd[-1]))
wbcd_z

wbcd_train<-wbcd_z[1:469,]
wbcd_test<-wbcd_z[470:569,]
wbcd_train_labels<-wbcd[1:469,1]
wbcd_test_labels<-wbcd[470:569,1]
wbcd_test_pred_z<-knn(train = wbcd_train, test=wbcd_test, cl = wbcd_train_labels, k = 21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred_z, prop.chisq = FALSE)

sms_raw<-read.csv('C:/Users/user/Desktop/016_/week16/3/sms_spam.csv', stringsAsFactors = FALSE)
# stringAsFactors -> 데이터유형이 문자형인 경우는 데이터 프레임을 생성할 때 factor로
# 변경하기 때문에 변경하지 말라고 바꿈꿈
str(sms_raw)
sms_raw$type<-factor(sms_raw$type)
str(sms_raw$type)
table(sms_raw$type)

install.packages('tm')
library(tm)

sms_corpus<-VCorpus(VectorSource((sms_raw$text)))
print(sms_corpus)
inspect(sms_corpus[1:2])

lapply(sms_corpus[1:2], as.character)
sms_corpus_clean<-tm_map(sms_corpus, content_transformer(tolower))
# tolower : 대문자인 경우 소문자로 바꿈
as.character(sms_corpus_clean[[1]])
lapply(sms_corpus_clean[1:2], as.character)
sms_corpus_clean<-tm_map(sms_corpus_clean, removeNumbers)
sms_corpus_clean<-tm_map(sms_corpus_clean, removeWords, stopwords())
sms_corpus_clean<-tm_map(sms_corpus_clean, removePunctuation)

removePunctuation('hello...world')
install.packages('SnowballC')
library(SnowballC)
wordStem((c('learn', 'learned', 'learning', 'learns')))
sms_corpus_clean<-tm_map(sms_corpus_clean, stemDocument)
sms_corpus_clean<-tm_map(sms_corpus_clean, stripWhitespace)
lapply(sms_corpus_clean[1:2], as.character)
sms_dtm<-DocumentTermMatrix(sms_corpus_clean)
sms_dtm2<-DocumentTermMatrix(sms_corpus, control = list(tolower=TRUE,
                                                        removeNumbers=TRUE,
                                                        stopwords=TRUE,
                                                        removePunctuation=TRUE,
                                                        stemming=TRUE
))
sms_dtm2
sms_dtm_train<-sms_dtm[1:4169,]
sms_dtm_test<-sms_dtm[4170:5559,]
sms_train_labels<-sms_raw[1:4169,]$type
sms_test_labels<-sms_raw[4170:5559,]$type

#train 과 test label의 비율을 봐보자
prop.table(table(sms_train_labels))
prop.table(table(sms_test_labels))
install.packages('wordcloud')
library(wordcloud)
wordcloud(sms_corpus_clean, min.freq = 50, random.order = FALSE)

sms_freq_words<-findFreqTerms(sms_dtm_train, 5)
str(sms_freq_words)
sms_dtm_freq_train<-sms_dtm_train[,sms_freq_words]
sms_dtm_freq_test<-sms_dtm_test[,sms_freq_words]

convert_counts<-function(x){
  x<-ifelse(x>0, 'Yes', 'No')
}
sms_train<-apply(sms_dtm_freq_train, MARGIN = 2, convert_counts)
sms_test<-apply(sms_dtm_freq_test, MARGIN = 2, convert_counts)
install.packages('e1071')
library(e1071)
sms_classifier<-naiveBayes(sms_train, sms_train_labels)
sms_test_pred<-predict(sms_classifier, sms_test)
library(gmodels)
CrossTable(sms_test_pred,
           sms_test_labels,
           prop.chisq=FALSE, prop.c=FALSE,
           prop.r=FALSE, dnn=c('predicted', 'actual'))
