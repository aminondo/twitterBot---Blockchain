library(rvest)
library(dplyr)
library(twitteR)


consumer_key = 'UiaBOjq2a6bgQrd3AwtvKJZWD'
consumer_secret = 'qiDxxpyLz6PieqNw8YJsfvanBMfCZt5uMx2wK9pfTlzIMl1EbU'
access_token = '874280764711612416-Zr51n68Ebk9G4PajTWDy0dkjnEn2eXA'
access_secret = 'iBBzLpK65hZ0clxHW6mUPlJXqFLBdFJKMxDwUfrG2bmVr'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#------------------------------------------------------------------------
#MINE BITCOIN REDDIT POST
#------------------------------------------------------------------------

reddit_blockchain <- read_html("https://www.reddit.com/r/BlockChain/top/?sort=top&t=month") %>% html_node("#thing_t3_6dqfq1 > div.entry.unvoted > p.title > a")
url = html_attr(reddit_blockchain, "href") #Extracts URL of Top Redddit Post
title = html_text(reddit_blockchain) #Extracts Title of Top Redddit Post
reddit_blockchain = paste("Read this month's top Reddit post on Blockchain: ", (paste(title, url, sep=" here "))) #Suggests top post
reddit_blockchain

#------------------------------------------------------------------------
#STATUS UPDATE ON TWITTER
#------------------------------------------------------------------------
blockchain_status = updateStatus(reddit_blockchain,bypassCharLimit=T)

