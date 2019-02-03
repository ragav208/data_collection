getGoogle <- function(symbol,number){

  # Warn about length
if (number>300) {
    warning("May only get 300 stories from google")
}
  
  
library(rvest)
url1 = "https://www.google.com/search?q="
url    = paste(url1, symbol, '&output=rss', "&start=", 1,
               "&num=", number, sep = '')
url    = URLencode(url)


title <- read_html(url) %>% html_nodes(".r") %>% 
  html_text()

content = read_html(url) %>% html_nodes('span.st') %>% html_text()

if(length(content)<length(title)){
content = c("NA",content)}

df <- data.frame(title = title, content = (content))
return(df)
}
chech <- getGoogle("ragav sridharan",10)
