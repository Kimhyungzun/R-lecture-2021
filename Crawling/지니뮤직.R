# 지니뮤직 일간 chart

library(rvest)
library(stringr)
library(dplyr)
library(httr)


rank_vec <- c()
last_vec <- c()
title_vec <- c()
artist_vec <- c()
album_vec <- c()

before_url <- "https://www.genie.co.kr/chart/top200?ditc=D&ymd=20210509&hh=17&rtm=N&pg="
for (p in 1:2) {
    url <- paste(before_url,p,sep="")
    html <- read_html(url)
    
    trs <- html %>% 
        html_node('#wrap-main') %>% 
        html_node('#wrap-body') %>%
        html_node('#body-content') %>%
        html_node('.newest-list') %>%
        html_node('tbody') %>% 
        html_nodes('tr')
    for (tr in trs) {
        rank <- tr %>% 
            html_node('.number') %>% 
            html_text()
        len <- str_length(rank) 
        rank <- as.integer(substring(rank, 1, len-NA))
        
    }
    
    
    
    
 
}
rank
