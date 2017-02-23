# library(janeaustenr)
# library(dplyr)
# library(stringr)
# library(tidytext)

#####
# Visualize sentiment analysis results
#####

# Load sentiment analysis results
# PAPER_NAMES <- c("daily", "independent", "thegaurdian", "telegraph")
# SENTIMENT_SCORES <- c(-0.7, 0.8, -0.9, 0.3)
PAPER_NAMES <- paper_name
SENTIMENT_SCORES <- sentiment_scores

NUM_PAPERS = 4

# Make sentimetn matrix (input for Shiny)
sentiment_matrix = matrix(SENTIMENT_SCORES, nrow=1, ncol=NUM_PAPERS)
colnames(sentiment_matrix) = PAPER_NAMES
