#f(x) = x^3 + 2x^2 + 7

x0<-1
x<-x0
f<-x^3 + 2*x^2 - 7
tolerance<-0.000001
while (abs(f)>tolerance){
  f.prime<-3*x^2+4*x
  x<-x-f/f.prime
  f<-x^3+2*x^2-7
}
x

x0<-1
x<-x0
f<-x^3 + 2*x^2 - 7
tolerance<-0.000001
repeat (abs(f)>tolerance) break
  f.prime<-3*x^2+4*x
  x<-x-f/f.prime
  f<-x^3+2*x^2-7
x

f<-function(){
  x<-1
  g()
  return(x)
}

g<-function(){
  x<-2
}
f()
