#linear regression line on iris
data(iris)
head(iris)
iris
#create a linear regression model with sepal.length as dependant variable
#and petal.length as the independant

#sepal.length is dependant
model<-lm(Sepal.Length ~ Petal.Length,data=iris)

summary(model)

plot(iris$Petal.Length,iris$Sepal.Length,
     main="Linear regression on iris dataset",
     xlab="Petal Length",
     ylab="Sepal length", pch=19,col="blue")  #pch shape

#add regression line
abline(model,col="red")

