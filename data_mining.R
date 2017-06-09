library(rvest)
library(dplyr)
library(reshape2)
library(ggplot2)


news <- read_html("http://www.the-blockchain.com/docs/index.php") %>% html_nodes(".thumbtext")

hrefs = html_children(news) %>% html_children() %>% html_attr("href")
hrefs = hrefs[!is.na(hrefs)]
hrefs
urls = lapply(1:length(hrefs), function(x) {
  url = sprintf("http://www.the-blockchain.com/docs/%s",gsub(" ","%20",hrefs[x]))
})
urls[[1]]

dates = html_children(news) %>% html_text(trim=T)#html_children()
dates[dates%%2==1,]
#dates = lapply(1:length(dates), function(x))