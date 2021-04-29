# 현실 세계의 모델링
x <- c(3,6,9,12.)
y <- c(3,4,5.5,6.5)
plot(x,y)

# model 1 : y=0.5x+1.0
y1 = 0.5*x + 1.0
y1

# 평균 제곱 오차 : Mean Squard Error
(y-y1)**2
sum((y-y1)**2)
mse <- sum((y-y1)**2)/ length(y)
mse

# model 2 : y=5/12x + 7/4
y2 <- 5*x / 12 + 7/4
y2

mse2 <- sum((y-y2)**2) / length(y)
mse2

# R의 단순 성형회귀 모델 lm
y
x
model <- lm(y ~ x)
model

plot(x,y)
abline(model,col='red')
fitted(model)
mse_model <- sum((y - fitted(model))**2 / length(y))

# 잔차 - Residuals
residuals(model)

# 잔차 제곱합
deviance(model)

# 평균 제곱오차(MSE)
deviance(model) / length(y)
summary(model)

#예측
newX <- data.frame(x=c(1.2,2.0,20.65,4.0))
newX
predict(model, newdata=newX)
newY <-predict(model, newdata=newX)
newY

# 연습문제 1.
X1 <- c(10.0, 12.0, 9.5, 22.2, 8.0)
Y1 <- c(360.2, 420.0, 359.5, 679.0, 315.3)

model <- lm(Y1~X1)
summary(model)
plot(X1,Y1)
abline(model,col='red')
residuals(model)
deviance(model) # 잔차 제곱합
deviance(model) / length(Y1) # 평균 제곱 오차
new_X <- data.frame(X1=c(10.5,25.0,15.0))
new_Y <- predict(model, newdata = new_X)

plot(new_X$X1,new_Y,pch=2)
abline(model, col ='red')










