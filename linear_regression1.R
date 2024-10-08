#height Predictor vector
x<-c(1,2,3,4,5)

#weight response vector
y<-c(3,4,2,4,5)

#lm()
relation<-lm(y~x)
#lm-regression &slope
summary(relation)

#find weight of person with given height
a<-data.frame(x=6.4)
a
result<-predict(relation,a)
result
