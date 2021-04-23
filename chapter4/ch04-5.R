# 데이터 정제
score <- read.csv('data/students2.csv')
score

for (i in 2:4) {
    score[, i] <- ifelse(score[,i]>100|score[,i]<0,NA,score[,i])
}
score

#결측값 처리
head(airquality)
sum(is.na(airquality))              #44
table(is.na(airquality))
        
sum(is.na(airquality$Temp))         # 0개
mean(airquality$Temp)

sum(is.na(airquality$Ozone))        # 37개
mean(airquality$Ozone)
mean(airquality$Ozone, na.rm=T)     # NA 배제한 평균

# 결측값 제거
air_narm <- na.omit(airquality)     # NA 제거
sum(is.na(air_narm))

# 결측값 대체
airquality$Ozone <- replace(airquality$Ozone,
                            is.na(airquality$Ozone),
                            mean(airquality$Ozone, na.rm = T))
head(airquality)

airquality$Solar.R <- replace(airquality$Solar.R,
                              is.na(airquality$Solar.R),
                              median(airquality$Solar.R, na.rm = T))
head(airquality)

# 이상값(Outliar) 처리
patients <- data.frame(name=c('환자1','환자2','환자3','환자4','환자5'),
                       age=c(22,20,25,30,27),
                       gender=factor(c('M','F','M','K','F')),
                       blood.type=factor(c('A','O','B','AB','C')))
patients
patients_outrm <- patients[patients$gender=='M'|patients$gender=='F',]
patients_outrm

# 성별과 혈액형의 이상치 제거
patients_outrm <- patients[patients$gender %in% c('M','F') & 
                                 patients$blood.type %in% c('A','B','O','AB'),]
patients_outrm      
      
# 이상치를 NA로 대체
patients2 <- data.frame(name=c('환자1','환자2','환자3','환자4','환자5'),
                       age=c(22,20,25,30,27),
                       gender=factor(c('M','F','M','K','F')),
                       blood.type=factor(c('A','O','B','AB','C')))
patients2$gender <- ifelse(patients2$gender %in% c('M','F'),
                           patients2$gender, NA)      
patients2$blood.type <- ifelse(patients2$blood.type %in% c('A','B','O','AB'),
                               patients2$blood.type, NA)      
patients2      
sum(is.na(patients2))      

# 숫자의 이상치
boxplot(airquality[, c(1:4)])
boxplot(airquality[,1])$stats
boxplot(airquality$Ozone)$stats

air <- airquality
air$Ozone <- ifelse(air$Ozone<1 | air$Ozone>122,
                    NA, air$Ozone)
boxplot(airquality$Ozone)$stats[1]      

sum(is.na(air$Ozone))
sum(is.na(airquality$Ozone))
mean(air$Ozone, na.rm = T)
mean(airquality$Ozone, na.rm = T)









