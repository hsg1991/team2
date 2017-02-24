

library(tm)
library(wordcloud)
library(memoise)

# The list of valid newspapers
papers <<- list("The Guardian" = "theguardian",
                "The Daily Mail" = "daily",
                "The Independent" = "independent",
                "The Telegraph" = "telegraph")

# Getting wordcloud matrix of words
getTermMatrix <- memoise(function(paper) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  if (!(paper %in% papers))
    stop("Unknown paper")
  
  text <- readLines(sprintf("./%s.csv", paper),
                    encoding="UTF-8")
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})


#code to count number of articles per paper
i=1
paperTitles <- character()
articleCount <- integer()

for (name in names(papers)) {
  paper <- papers[[name]]
  
  nrows <- sapply(sprintf("./%s.csv", paper), function(f) nrow(read.csv(f)) )
  paperTitles[i] <- name
  articleCount[i] <- sum(nrows)
  i <- i+1
}
papersArticleCountDF <- data.frame(paperTitles, articleCount, stringsAsFactors=FALSE)