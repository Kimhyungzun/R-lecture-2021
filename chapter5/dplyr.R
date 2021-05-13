# Avocado 사례
library(dplyr)

avocado <- read.csv('data/avocado.csv')
glimpse(avocado)

# 지역별 평균 판매량과 가격
avocado %>%
      group_by(region) %>%
      summarise(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

# 지역별 연도별 평균 판매량과 가격
avocado %>%
      group_by(region, year) %>%
      summarise(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

# 지역별 연도별 유기농여부에 따른 평균 판매량과 가격
avocado %>%
      group_by(region, year, type) %>%
      summarise(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

# 그룹 단위 통계
library(ggplot2)
x_avg <- filter(region != 'TotalUS') %>% ggplot(aes(year, Y_avg, col = type)) +
      geom_line() + facet_wrap(~region)

avocado %>%
      group_by(region, year, type) %>%
      summarise(P_avg=mean(AveragePrice),V_avg=mean(Total.Volume)) %>%
      filter(region != 'TotalUS') %>%
      ggplot(aes(year,V_avg, col=type)) +
      geom_line() +
      facet_wrap(!region)

x_avg <- avocado %>%
      group_by(region, year, type) %>%
      summarise(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))

arrange(x_avg, desc(V_avg)) %>% head(10)
x_avg <- x_avg %>%
      filter(region != 'TotalUS')
arrange(x_avg, desc(V_avg)) %>% head(10)

avocado %>%
      filter(region == 'California' & year == 2018) %>%
      select(region, Date, AveragePrice, Total.Volume, type)

# 연도별이 아닌 월별 집계
library(lubridate)
year('2021-04-26')
month('2021-04-26')
day('2021-04-26')
wday('2021-04-26')

m_avg <- avocado %>%
      group_by(region, year, month(Date), type) %>%
      summarise(P_avg=mean(AveragePrice), V_avg=mean(Total.Volume))
head(m_avg)








