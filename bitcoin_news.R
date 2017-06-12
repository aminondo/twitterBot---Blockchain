install.packages("dplyr")
install.packages("mgcv")

library(twitteR)
library(dplyr)
library(rvest)
library(mgcv)

consumer_key = 'UiaBOjq2a6bgQrd3AwtvKJZWD'
consumer_secret = 'qiDxxpyLz6PieqNw8YJsfvanBMfCZt5uMx2wK9pfTlzIMl1EbU'
access_token = '874280764711612416-Zr51n68Ebk9G4PajTWDy0dkjnEn2eXA'
access_secret = 'iBBzLpK65hZ0clxHW6mUPlJXqFLBdFJKMxDwUfrG2bmVr'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


#------------------------------------------------------------------------
#Top articles about bitcoin at newbtc
#------------------------------------------------------------------------
news <- read_html("https://news.bitcoin.com/") %>% html_nodes("#post-272603 > div.post-info > h3 > a")


#log = list()
log = readRDS("log.rds")

hrefs = html_children(news) %>% html_children() %>% html_attr("href")
hrefs = hrefs[!is.na(hrefs)]
hrefs
urls = lapply(1:length(hrefs), function(x) {
  url = sprintf("https://news.bitcoin.com/%s",gsub(" ","%20",hrefs[x]))
})


#choose a random article
num = sample(1:length(urls),1)
twt = sprintf("Check this article out: %s\n\n#news.bitcoin #twitterBots",urls[[num]])
while (twt %in% log) {
  print("running")
  num = sample(1:length(urls),1)
  twt = sprintf("Check this article out\n: %s\n\n#news.bitcoin #twitterBots",urls[[num]])
}

status = tweet(twt,bypassCharLimit=T)
#deleteStatus(status)
log = c(log,twt)
saveRDS(log,"log.rds")

