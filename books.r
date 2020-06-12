install.packages("recommenderlab")
library("recommenderlab")
library(caTools)
## book rating data
book_ratingdata<- read.csv("E:\\Assignment\\recomendation engineer\\data\\books.csv")
View(book_ratingdata)
is.null(book_ratingdata)
#metadata about the variable
str(book_ratingdata)
## rating distribution
summary(getRatings(book_ratingdata))
hist(book_ratingdata$ratings...3.)
#the datatype should be realRatingMatrix inorder to build recommendation engine
book_ratingdatamatrix <- as(book_ratingdata, 'realRatingMatrix')
book_ratingdatamatrix 
#Popularity based 
book_recom_model<-Recommender(book_ratingdatamatrix,method = "POPULAR")
book_recom_model
#Predictions for two users 
recommended_items1 <- predict(book_recom_model, book_ratingdatamatrix[100:101], n=5)
as(recommended_items1,"list")
recommended_items1
## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering
book_recom_model2<-Recommender(book_ratingdatamatrix,method="UBCF")
book_recom_model2
#Predictions for two users 
recommended_items21 <- predict(book_recom_model2,book_ratingdatamatrix[100:101],n=5)
as(recommended_items21,"list")
recommended_items21
