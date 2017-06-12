library(rvest)
library(dplyr)

library(twitteR)


consumer_key = 'doYt4LvCnp7Bz58FJRhPPL1nj'
consumer_secret = 'ZDTAsQZes2GGq7HtSmXXmV38bbtMV83McVQDy3WqGCw2GZnwGf'
access_token = '859412098799030272-cZSQHV13JQt2wq5l61mGby0ceFqL5Ns'
access_secret = 'j3RGzNbG0WWSVybnwwh1ScAXoM0gWWxLp2hxqPOBe5B6p'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#------------------------------------------------------------------------
#MINE BITCOIN REDDIT POST
#------------------------------------------------------------------------

reddit_bitcoin <- read_html("https://www.reddit.com/r/Bitcoin/top/?sort=top&t=day") %>% html_node("#thing_t3_6gly8r > div.entry.unvoted > p.title > a")
url = html_attr(reddit_bitcoin, "href") #Extracts URL of Top Redddit Post
title = html_text(reddit_bitcoin) #Extracts Title of Top Redddit Post
reddit_bitcoin = paste("Check out today's top Reddit post on Bitcoin", (paste(title, url, sep=" here "))) #Suggests top 
reddit_bitcoin

#------------------------------------------------------------------------
#STATUS UPDATE ON TWITTER
#------------------------------------------------------------------------
bitcoin_status = updateStatus(reddit_bitcoin,bypassCharLimit=T)

