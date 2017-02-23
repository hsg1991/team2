#####
# Visualize # articles / year in each paper stacked
#####

# Load statistics from "Exploratory"

library(datasets)

PAPER_NAMES <- c("daily", "independent", "thegaurdian", "telegraph")
DATES <- c(1951, 1956, 1957, 1958, 1959, 1960, 1961)
SENTIMENT_SCORES <- matrix(1:28, 7, 4)

NUM_PAPERS = 4

# Make sentimetn matrix (input for Shiny)

article_matrix = matrix(SENTIMENT_SCORES, nrow=7, ncol=NUM_PAPERS)
colnames(article_matrix) = PAPER_NAMES
rownames(article_matrix) = DATES
