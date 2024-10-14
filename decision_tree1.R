#anotropy for decision tree
#


#step 1: install lib

install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

#step2: load iris

data(iris)
str(iris)

#training and test sets
set.seed(42)

indexes=sample(1:nrow(iris),0.7*nrow(iris))
iris_train=iris[indexes, ]
View(iris_train)
iris_test=iris[-indexes, ]#test data(30%)

#step4 define target formula and train decision tree

target=Species~ Sepal.Length +Sepal.Width +Petal.Length+ Petal.Width

tree = rpart(target,data=iris_train,method= "class")

#step5: Visualise decision tree
rpart.plot(tree)

#step6 make predictions on test set
predictions=predict(tree,iris_test,type="class")

#step 7 : eval model by creating confusion matrix
confusion_matrix=table(iris_test$Species,predictions)
print(confusion_matrix)
  
#step 8:calculate accuracy
accuracy=sum(diag(confusion_matrix))/sum(confusion_matrix)
print(paste("Accuracy: ",round(accuracy,4)))
