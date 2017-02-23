library(tidytext)
library(janeaustenr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)

# read news articles
news <- read.csv("Desktop/Datathon/data/The_Daily_Mail/232837/categories/daily232837_filter_Environment.csv", header = TRUE, sep = ",")

# seperate content column
#news_content <- news['content']

# convert the type from fctr type to chr type
#news_content[,1] <- sapply(news_content[,1], as.character)
news[,1:9] <- sapply(news[,1:9], as.character)

# tokenization
#t <- tbl_df(news_content) %>%
t <- tbl_df(news) %>%
  mutate(line_number=row_number()) %>%
  unnest_tokens(word,content)

# do sentiment analysis
news_sentiment <- t %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line_number %/% 100, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

# sentiment score for the corpus
daily_mail_score <- sum(news_sentiment[5])




# read news articles
news <- read.csv("Desktop/Datathon/data/The_Guardian/232837/categories/news_theguardian_filter_Environment.csv", header = TRUE, sep = ",")

# seperate content column
#news_content <- news['content']

# convert the type from fctr type to chr type
#news_content[,1] <- sapply(news_content[,1], as.character)
news[,1:9] <- sapply(news[,1:9], as.character)

# tokenization
#t <- tbl_df(news_content) %>%
t <- tbl_df(news) %>%
  mutate(line_number=row_number()) %>%
  unnest_tokens(word,content)

# do sentiment analysis
news_sentiment <- t %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line_number %/% 100, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

# sentiment score for the corpus
guardian_score <- sum(news_sentiment[5])

# read news articles
news <- read.csv("Desktop/Datathon/data/The_Independent/232837/categories/news_indepedent_filter_Environment.csv", header = TRUE, sep = ",")

# seperate content column
#news_content <- news['content']

# convert the type from fctr type to chr type
#news_content[,1] <- sapply(news_content[,1], as.character)
news[,1:9] <- sapply(news[,1:9], as.character)

# tokenization
#t <- tbl_df(news_content) %>%
t <- tbl_df(news) %>%
  mutate(line_number=row_number()) %>%
  unnest_tokens(word,content)

# do sentiment analysis
news_sentiment <- t %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line_number %/% 100, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

# sentiment score for the corpus
independent_score <- sum(news_sentiment[5])

# read news articles
news <- read.csv("Desktop/Datathon/data/The_Telegraph/232837/categories/telegraph232837_filter_Environment.csv", header = TRUE, sep = ",")

# seperate content column
#news_content <- news['content']

# convert the type from fctr type to chr type
#news_content[,1] <- sapply(news_content[,1], as.character)
news[,1:9] <- sapply(news[,1:9], as.character)

# tokenization
#t <- tbl_df(news_content) %>%
t <- tbl_df(news) %>%
  mutate(line_number=row_number()) %>%
  unnest_tokens(word,content)

# do sentiment analysis
news_sentiment <- t %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line_number %/% 100, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

# sentiment score for the corpus
telegraph_score <- sum(news_sentiment[5])

paper_name = c("daily_mail", "guardian", "independent", "telegraph")
sentiment_scores <- c(daily_mail_score, guardian_score, independent_score, telegraph_score)