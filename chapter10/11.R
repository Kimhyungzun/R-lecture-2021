library(survival)
library(randomForest)

head(colon)
set.seed(2021)
clean_colon <- na.omit(colon)
data <- clean_colon[sample(nrow(clean_colon)),]
data$status <- as.factor(data$status)
options(digits = 4)
for(a in seq(5,20,5)) {
    k <- a
    q <- nrow(data) / k
    l <- 1:nrow(data)
    accuracy <- 0
    for (i in 1:k) {
        test_list <- ((i-1)*q+1) : (i*q)
        data_test <- data[test_list,]
        data_train <- data[-test_list,]
        rf <- randomForest(status~., data_train)    
        pred <- predict(rf, data_test, type = 'class')
        t <- table(pred, data_test$status)
    }
    accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
    t
    accuracy
}


################################
k <- 5
q <- nrow(data) / k
l <- 1:nrow(data)
accuracy <- 0
for (i in 1:k) {
    test_list <- ((i-1)*q+1) : (i*q)
    data_test <- data[test_list,]
    data_train <- data[-test_list,]
    rf <- randomForest(status~., data_train)    
    pred <- predict(rf, data_test, type = 'class')
    t <- table(pred, data_test$status)
}
accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
t
accuracy

k <- 10
q <- nrow(data) / k
l <- 1:nrow(data)
accuracy <- 0
for (i in 1:k) {
    test_list <- ((i-1)*q+1) : (i*q)
    data_test <- data[test_list,]
    data_train <- data[-test_list,]
    rf <- randomForest(status~., data_train)    
    pred <- predict(rf, data_test, type = 'class')
    t <- table(pred, data_test$status)
}
accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
t
accuracy

k <- 15
q <- nrow(data) / k
l <- 1:nrow(data)
accuracy <- 0
for (i in 1:k) {
    test_list <- ((i-1)*q+1) : (i*q)
    data_test <- data[test_list,]
    data_train <- data[-test_list,]
    rf <- randomForest(status~., data_train)    
    pred <- predict(rf, data_test, type = 'class')
    t <- table(pred, data_test$status)
}
accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
t
accuracy


k <- 20
q <- nrow(data) / k
l <- 1:nrow(data)
accuracy <- 0
for (i in 1:k) {
    test_list <- ((i-1)*q+1) : (i*q)
    data_test <- data[test_list,]
    data_train <- data[-test_list,]
    rf <- randomForest(status~., data_train)    
    pred <- predict(rf, data_test, type = 'class')
    t <- table(pred, data_test$status)
}
accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
t
accuracy

###################
for(i in seq(5,20,5)) {
    as.integer(i/5)
}