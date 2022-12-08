#install.packages('ggplot2')
library(ggplot2)
x<-c(1,2,3)
y<-c(4,5,6)
cbind(x,y)
rbind(x,y)

var1<-1:5
var2<-seq(from=1, to=5, by=1.5)
var2
var3<-rep(1:3, time=3)
var3
var4<-rep(1:3, each=3)
var4

mx1<-matrix(c(1:6), nrow=3, ncol=2)
mx1
mx2<-matrix(c(1:6), nrow=3, ncol=2, byrow=TRUE)
mx2
mx1*mx2
mx1%*%t(mx2)

rnames<-c('행1','행2','행3')
cnames<-c('열1','열2')
r_c_names<-list(rnames,cnames)
mx3<-matrix(c(1:6), nrow=3, ncol=2, byrow=FALSE, dimnames=r_c_names)
mx3

lst<-list(name='fred', wife='mary', child.ages=c(4,6,9))
lst

name<-c('kim','lee','park','oh')
sex<-c('f','m','f','m')
income<-c(100,200,300,204)
d1<-data.frame(name=name, gender=sex, income=income)
d1
head(d1,2)
names(d1)
names(d1)[3]
nrow(d1)
ncol(d1)
dim(d1)
