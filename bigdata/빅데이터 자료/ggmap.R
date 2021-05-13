data <- choose.files()
df<- read.csv(data)
install.packages('ggmap')
library(ggmap)
library(dplyr)
library(ggplot2)

### 경도와 위도 상자 좌표 계산 함수
fn_lon_let_box <- function(lon , lat, dist=1){
    h <- 0.0035*3.5*dist
    w <- 0.0035*4*dist
    c(lon-w, lat-h,lon+w,lat+h)
}
# 경도와 위도로 표시할 중심 좌표와 거리
boxLocation <- fn_lon_let_box(127.4211,36.3545,10) #대전역
# 지도 다운로드
krMap <- get_map(location=boxLocation)
# 지도 표시
ggmap(krMap)

df_cafe <- df %>% subset(상권업종대분류명=='음식')
ggmap(krMap) +geom_point(data = df_cafe, aes(x=경도,y=위도, colour = 시군구명))

df_cafe <- df %>% subset(상권업종대분류명=='커피전문점/카페/다방')
ggmap(krMap) +geom_point(data = df_cafe, aes(x=경도,y=위도, colour = 시군구명))

df_cafe <- df %>% subset(상권업종대분류명=='커피전문점/카페/다방')
ggmap(krMap) +geom_point(data = df_cafe, aes(x=경도,y=위도, colour = 시군구명))

df_cafe <- df %>% subset(상권업종대분류명=='커피전문점/카페/다방')
ggmap(krMap) +geom_point(data = df_cafe, aes(x=경도,y=위도, colour = 시군구명))


head(df)
df[2,c(2,3)]
df1 <- df[,c(2,3)]
head(df1)

str(df)


df2 <- df[,c(2,5,7,9,11,15,19,27,38,39)]

write.csv(df2,'상권정보가공데이터.csv',row.names = F)

getwd()













