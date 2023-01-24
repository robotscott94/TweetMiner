# TweetMiner
This program pulls data from Twitter and returns data in a matrix structure that can be used to mimic semantics.

- This program connects to the Twitter API using R's TwitteR package. A valid API key is needed to run the code. 

- A profile name is entered and tweets are pulled

- Data is cleaned, words are tokenized and word counts are performed

- A stochastic tranisition matrix is created using all unique words and their respective frequencies

- This output serves as the transition matrix for a Markov chain. Steps can be made through the matrix where each step depends on the probability of the next word used. This allows for the modelling and output of language similar to that of the original Twitter user.
