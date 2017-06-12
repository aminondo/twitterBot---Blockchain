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

reddit_bitcoin <- read_html("https://www.reddit.com/r/Bitcoin/top/?sort=top&t=day") %>% html_node("#thing_t3_6gly8r > div.entry.unvoted > p.title > a")
url = html_attr(reddit_bitcoin, "href") #Extracts URL of Top Redddit Post
title = html_text(reddit_bitcoin) #Extracts Title of Top Redddit Post
reddit_bitcoin = paste("Check out today's top Reddit post on Bitcoin:", (paste(title, url, sep=" here "))) #Suggests top 
reddit_bitcoin

#------------------------------------------------------------------------
#STATUS UPDATE ON TWITTER
#------------------------------------------------------------------------
bitcoin_status = updateStatus(reddit_bitcoin,bypassCharLimit=T)

