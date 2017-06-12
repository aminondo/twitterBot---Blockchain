library(twitteR)
library(dplyr)
library(rvest)
library(mgcv)

consumer_key = 'doYt4LvCnp7Bz58FJRhPPL1nj'
consumer_secret = 'ZDTAsQZes2GGq7HtSmXXmV38bbtMV83McVQDy3WqGCw2GZnwGf'
access_token = '859412098799030272-cZSQHV13JQt2wq5l61mGby0ceFqL5Ns'
access_secret = 'j3RGzNbG0WWSVybnwwh1ScAXoM0gWWxLp2hxqPOBe5B6p'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#------------------------------------------------------------------------
#MINE ARTICLES IN THE-BLOCKCHAIN WEBSITE
#------------------------------------------------------------------------
news <- read_html("http://www.the-blockchain.com/docs/index.php") %>% html_nodes(".thumbtext")
#log = list()
log = readRDS("log.rds")

hrefs = html_children(news) %>% html_children() %>% html_attr("href")
hrefs = hrefs[!is.na(hrefs)]
hrefs
urls = lapply(1:length(hrefs), function(x) {
  url = sprintf("http://www.the-blockchain.com/docs/%s",gsub(" ","%20",hrefs[x]))
})


#choose a random article
num = sample(1:length(urls),1)
twt = sprintf("Check this article out: %s\n\n#blockchain #twitterBots",urls[[num]])
while (twt %in% log) {
  print("running")
  num = sample(1:length(urls),1)
  twt = sprintf("Check this article out\n: %s\n\n#blockchain #twitterBots",urls[[num]])
}

status = tweet(twt,bypassCharLimit=T)
#deleteStatus(status)
log = c(log,twt)
saveRDS(log,"log.rds")

