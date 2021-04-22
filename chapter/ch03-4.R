# 데이터 프레임
name <- c('철수','춘향','길동')
age <- c(22,20,25)
gender <- factor(c('M','F','M'))
blood.type <- factor(c('A','O','B'))

patients <- data.frame(name, age, gender, blood.type)
patients

patients$name
typeof(patients$name)
patients[1,]  # 첫 번째 행 모두
patients[,2]  # patients$age 와 동일
patients[2,3]
patients$gender[2]
patients[patients$name=='철수',]  
patients[patients$name=='철수',c('age',"gender")]

#데이터 프레임의 속성명을 변수명으로 사용(attach~detach)
attach(patients)  #patients 생략
name
blood.type
detach(patients)

head(cars)
attach(cars)
speed
dist
detach(cars) 
speed   #에러: 객체 'speel'를 찾을 수 없습니다
mean(cars$speed)
max(cars$dist)
with(cars, mean(speed)) #mean(cars$speed) 와 동일 


#subset
subset(cars,speed>20)
cars[cars$speed>20,]
subset(cars, speed>20, select=c(dist))
cars[cars$speed>20,c('dist')]

# 결측값(NA) 처리
head(airquality)
str(airquality)
sum(airquality$Ozone)

head(na.omit(airquality)) #NA 행 제거

#병함(merge)
patients
patients1 <- data.frame(name,age,gender)
patients2 <- data.frame(name,blood.type)
merge(patients1,patients2, by ='name')





