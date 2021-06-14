#Install the appropriate packages
##install.packages("twitteR")
library("twitteR")

#REPLACE '####' with the appropriate values from your twitter app
consumerKey='JHi7Ac7iQbR8HYd8IXwgXQF0j'
consumerSecret='KXKqw3U0EALKysuP66y6wmZuSe1QX9YnmTGJ8GvjP6ktuh2N5S'
accessToken='1091084617187233793-7qtgPe4EYQXRhLqWL9XG6HGKBFI2gB'
accessTokenSecret= '6InBQinaqV3uiscrp1iifaGyqLGTpLmkf0nh62Bnowl0P'

#Connect to twitter
setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)

tweets <- userTimeline('CNN', n=50, maxID=NULL, sinceID=NULL, includeRts=FALSE, 
                       excludeReplies=TRUE)


tweetsDF <-twListToDF(tweets)


txtlist <- tweetsDF$text
txtlist
#install.packages('tm')
require(tm)

#save text
Minedtext <- sapply(tweets, function(x) x$getText())

#create corpus
Minedtext_corpus <- Corpus(VectorSource(Minedtext))


# make each letter lowercase
#Minedtext_corpus <- tm_map(Minedtext_corpus, tolower) 

# remove punctuation 
#Minedtext_corpus <- tm_map(Minedtext_corpus, removePunctuation)

Minedtext_corpus

# Changing Corpus to DF

dataframe2 <- data.frame(text=sapply(Minedtext_corpus, identity), 
                        stringsAsFactors=F)
dataframe2



##install.packages("stringr")
library(stringr)

#Put words of tweets into a dataframe

allwords = str_split_fixed(dataframe2[["text"]], " ", Inf)
allwords


startWords <- matrix(c(allwords[,1]), ncol = 1)
startWords

wordLine <- matrix(allwords,ncol = 1)
wordLine

