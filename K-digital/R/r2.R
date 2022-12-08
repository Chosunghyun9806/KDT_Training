#plot : 저수준의 함수 -> 직관적으로 알아보기 쉬움 시각화 중요
x<-rnorm(100,sd=2)
y<-0.3+2*x+rnorm(100,sd=1)
# y = ax+b+입실론(white noise)
#rnorm -> normal distribution (정규분포)
plot(x)

library(MASS)
head(Animals)
plot(x=Animals$body,y=Animals$brain, pch=16, col='blue',
     xlab = 'Body Weight(Kg)', ylab='Brain weight(g)',
     xlim=c(0,250), ylim=c(0,1400))
text(x=Animals$body,y=Animals$brain, labels=row.names(Animals), pos=4)
plot(~Sepal.Length+Sepal.Width, data=iris, pch=rep(15:17, each=50),
     col=c('red','blue','green')[iris$Species], cex=1.5)
legend('topright', legend = levels(iris$Species), pch=15:17,
       col=c('red','blue','green'), cex=1.2, bty='o')

pie.sales<-c(0.12,0.3,0.26,0.16,0.04,0.12)
barplot(pie.sales, names.arg = c('Blueberry','Cherry','Apple','Boston Cream',
                                 'other','vanilla cream'), las=1)
barplot(pie.sales, las=2)
#barplot options:

counts<-table(mtcars$vs, mtcars$gear)
counts
#count1<-data.frame(mtcars$vs, mtcars$gear)
#count1
barplot(counts, main='Car distribution by gears and VS',
        xlab='Num of gears', col=c('darkblue','red'),
        legend=rownames(counts), horiz=T, angle=45)
#horiz -> T(True)가로 F(False)세로
pie(pie.sales)

#par() 함수 (subplot)
x<-rnorm(100)
hist(x)
plot(x)
par(mfrow=c(1,1))
#cars dataset : 자동차의 속도(speed)와 정지시까지의 거리(dist)
data(cars)
head(cars,3)
hist(cars$speed, nclass=8, main='Histogram', xlab='speed')

#box plot
boxplot(Sepal.Length~Species, data=iris, main='Box plot')
#scatter plot
plot(cats)
plot(Petal.Length~ Sepal.Length, data=iris, bty='l', pch=20)
abline(a=0, b=1, lty=2, lwd=2)
# lty=2 : line type / lwd(line width)
abline(lm(Petal.Length~ Sepal.Length, data=iris), lty=1, lwd=2)
# 여러개의 산점도를 동시에 그리기 : pair()
pairs(iris[,1:4], main="Fisher's iris data",
      pch=21, bg=c('red','green3','blue'))
#[unclass](iris$Species)
