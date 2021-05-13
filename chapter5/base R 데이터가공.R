### base R 을 이용한 데이터 가공

library(gapminder)
library(dplyr)

glimpse(gapminder)

# 각 나라의 기대수명(lifeExp)
tail(gapminder[, c('country','lifeExp','year')])

# 샘플과 속성의 추출(filtering and selection)
gapminder[1000:1009,c('country','lifeExp','year')]
gapminder[gapminder$country=='Croatia',]
gapminder[gapminder$country=='Croatia',c('year','pop')]

# 크로아티아의 1990년도 이후의 연도,기대수명과 인구
gapminder[gapminder$country=='Croatia' & gapminder$year>1990,c('year', 'lifeExp','pop')]

# 행/열 단위의 연산
# 크로아티아의 기대수명, 인구의 평균
apply(gapminder[gapminder$country=='Croatia',c('lifeExp','pop')], 
      2, mean)

# 크로아티아의 연평균 인구 증가율 계산
#croatia_CAGR <- (4493312/3882229)**(1/55)-1 0.002661364

peaktopeak <- function(x) {
      return(max(x) -min(x))
}
apply(gapminder[gapminder$country == 'Croatia',c('lifeExp','pop')], 2, peaktopeak)











