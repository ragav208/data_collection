library(rvest)
content <- read_html('https://news.ycombinator.com/')
# title <- content %>% html_nodes('a.storylink') %>% html_text() 

details <- content %>% html_nodes('a.storylink') %>% html_attr("href") %>%
  as.data.frame() %>% rename("link"=".") %>%
  mutate(title = content %>% html_nodes('a.storylink') %>% html_text()) %>%
  mutate(score = c(content %>% html_nodes('span.score') %>% html_text(),NA)) %>% 
  mutate(age = content %>% html_nodes('span.age') %>% html_text()) %>% 
  mutate(link = as.character(link)) 
str(details)

i = details$link[8]

 article = c()
# 
 for(i in details$link){
   print(i)
  if(url.exists(i)){
   curr_article <- read_html(as.character(i)) %>% html_nodes('p') %>%html_text()
  curr_article <- paste(curr_article,collapse  = "   ")
  article <-  c(article, curr_article)
  }else{
    article <- c(article,NA)
    message("url does not exist ")
  }
   }

 details$article <- article
 # length(article)
