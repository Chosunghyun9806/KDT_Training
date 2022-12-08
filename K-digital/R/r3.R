WorldPhones51<-WorldPhones
WorldPhones
summary(WorldPhones51)
barplot(WorldPhones51)
barplot(WorldPhones51, cex.names=0.75, cex.axis=0.75, main = 'Numbers of Telephones in 1951')
# cex.names : 범주형, x축 이름인 라벨의 문자 크기
# cex.axis : 좌표축, y축에 출력되는 수치형 라벨의 문자
# 크기 
dotchart(WorldPhones51, xlab="Number of Phones('000s')")

VADeaths
barplot(VADeaths, beside=TRUE, legend=TRUE, ylim= c(0,90), ylab='Deaths per 1000', main='Death rates in virginia')
#beside : 우측 상단 범례를 추가.
dotchart(VADeaths, xlim=c(0,75), xlab = 'Deaths per 1000', main = 'Death rates in Virginia',
         cex = 0.8)
# cex : 그래프 문자 크기 조절

# 고급 그래프 선택 시 고려사항
#1. 데이터의 유형(범주형, 연속형)
#2. 독자(여러분 자신 또한 충분히 교육받은 독자를 위한 것이라면 보다 정교하게 이해시키려고 생각함)
# RcolorBrewer패키지는 다수의 팔레트(palettes) 또는 색상을 선택할 수 있는 사양을 포함한다.
# 저급 그래픽 함수 : barplot(), dotchart(), plot
# abline -> seaborn -> regplot
plot(circumference~age, pch = as.numeric(as.character(Tree)), data = Orange)
# pch : 점의 종류, 문자로 지정하면 지정한 문자로 그래프를 그린다
#install.packages('ggpubr')
library(ggpubr)
abline(lm(circumference~age, data=Orange, subset=Tree=='1'), lty=1)
abline(lm(circumference~age, data=Orange, subset=Tree=='2'), lty=2)
abline(lm(circumference~age, data=Orange, subset=Tree=='3'), lty=3, lwd=2)
abline(lm(circumference~age, data=Orange, subset=Tree=='4'), lty=4)
abline(lm(circumference~age, data=Orange, subset=Tree=='5'), lty=5)
legend('topleft', legend = paste('Tree', 1:5), lty = 1:5, pch = 1:5, lwd = c(1,1,2,1,1))

# 4장. 프로그래밍
# 프로그래밍 : 단순한 명령보다 상대적으로 복잡한 명령 체계를 작성하는 것을 포함함
# for (name in vector) {commands}
n<-100
result<-1
for (i in 1:n)
  result<-result*i
result

Fibonacci<-numeric(12)
Fibonacci[1]<-Fibonacci[2]<-1
for (i in 3:12)
  Fibonacci[i]<-Fibonacci[i-2]+Fibonacci[i-1]
Fibonacci

library(grid)
for (i in 1:100){
  vp<-viewport(x=.46, h=.9, w=.0, angle = i)
  pushViewport(vp)
  grid.circle()
}
vp

x<-3
if (x>2) y<-2*x else y<-3*x
y
corplot<-function(x,y,plotit){
  if (plotit==TRUE) plot(X,y)
  cor(x,y)
}
corplot(c(2,5,7),c(5,6,8),FALSE)

Eratosthenes<-function(n){
  # 에라토스테네스의 체에 근거해서 n까지 모든 수를 반환하라
  if (n>=2){
    sieve<-seq(2,n)
    prime<-c()
    for (i in seq(2,n)){
      if (any(sieve==i)){
        prime<-c(prime, i)
        sieve<-c(sieve[(sieve%%i)!=0],i)
      }
    }
    return(prime)
  }else{
    stop('input value of n should be at least 2')
  }
}
Eratosthenes[50]
