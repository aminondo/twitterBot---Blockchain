library(rvest)
library(dplyr)
library(twitteR)
library(pipeR)


consumer_key = 'doYt4LvCnp7Bz58FJRhPPL1nj'
consumer_secret = 'ZDTAsQZes2GGq7HtSmXXmV38bbtMV83McVQDy3WqGCw2GZnwGf'
access_token = '859412098799030272-cZSQHV13JQt2wq5l61mGby0ceFqL5Ns'
access_secret = 'j3RGzNbG0WWSVybnwwh1ScAXoM0gWWxLp2hxqPOBe5B6p'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#------------------------------------------------------------------------
#MINE BITCOIN REDDIT POST
#------------------------------------------------------------------------

reddit_blockchain <- read_html("https://www.reddit.com/r/BlockChain/top/?sort=top&t=month") %>% html_node("#thing_t3_6dqfq1 > div.entry.unvoted > p.title > a")
url = html_attr(reddit_blockchain, "href") #Extracts URL of Top Redddit Post
title = html_text(reddit_blockchain) #Extracts Title of Top Redddit Post
reddit_blockchain = paste("Read this month's top reddit post on Blockchain ", (paste(title, url, sep=" here "))) #Suggests top post
reddit_blockchain

#------------------------------------------------------------------------
#STATUS UPDATE ON TWITTER
#------------------------------------------------------------------------
blockchain_status = tweet(reddit_blockchain,bypassCharLimit=T)

