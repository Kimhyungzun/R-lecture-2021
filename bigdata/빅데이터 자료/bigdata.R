library(ggmap)
library(dplyr)
library(ggplot2)
library(plotly)
data <- choose.files()
df<- read.csv(data)

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

# 시군구별 스포츠 교육기관
df_sports <- df %>% subset(표준산업분류명=='스포츠 교육기관')
ggmap(krMap) +geom_point(data = df_cafe, aes(x=경도,y=위도, colour = 시군구명))

df_sports_plot <- df_sports %>%
    group_by(시군구명) %>%
    summarise(n=n()) %>%
    ggplot(aes(시군구명,n),col=시군구명) +
    geom_bar(stat='identity',aes(fill=시군구명)) +
    scale_fill_brewer(palette='Blues')
    
df_sports_da <- df_sports %>%
    filter(시군구명 == '대덕구')

df_sports_da
df_sports_da_n <- df





df1 <- df %>%
    filter(상권업종대분류명 == '음식') %>%
    group_by(시군구명) %>%
    summarise('음식'=n())
df_1 <- ggplot(df1,aes(시군구명,음식),col=시군구명) +
    geom_bar(stat='identity',aes(fill=시군구명)) +
    scale_fill_brewer(palette='Blues')
ggplotly(df_1)



    










