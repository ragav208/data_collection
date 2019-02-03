library(rvest)
content <- read_html('https://news.ycombinator.com/')
title <- content %>% html_nodes('a.storylink') %>% html_text()

link_domain <- content %>% html_nodes('span.sitestr') %>% html_text()
score <- content %>% html_nodes('span.score') %>% html_text()
score = c(1,score)
age <- content %>% html_nodes('span.age') %>% html_text()

df <- data.frame(title = title, link_domain = link_domain, score = score, age = age)

