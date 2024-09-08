
#breast cancer dataset

getwd()
wbcd <- read.csv("wisc_bc_data.csv",stringsAsFactors = FALSE)
#structure
str(wbcd)
#removing id
wbcd<- wbcd[-1]
#table : tells frequency
table(wbcd$diagnosis)
wbcd$diagnosis <- factor(wbcd$diagnosis, levels=c("B","M"),
                         labels=c("Bening","Malignant"))
round(prop.table(table(wbcd$diagnosis))*100,digits=1)
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])
normalize<-function(x){
  return ((x-min(x)) / max(x)-min(x))
}
#lapply function
wbcd_n=as.data.frame(lapply(wbcd[2:31],normalize))
summary(wbcd_n$area_mean)
wbcd_train=wbcd_n[1:469,]
wbcd_test=wbcd_n[470:569,]
wbcd_test_label=wbcd[470:569,1]
wbcd_train_label=wbcd[1:469,1]
install.packages("class")
library("class")
wbcd_test_pred<-knn(train=wbcd_train,test =wbcd_test,cl=wbcd_train_label,k=21)
install.packages("gmodels")
library("gmodels")
CrossTable(x=wbcd_test_label,y=wbcd_test_pred,prop.chisq = FALSE)
aa=table(wbcd_test_label,wbcd_test_pred)
install.packages("caret")
library("caret")
#check accuracy level
confusionMatrix(aa)


