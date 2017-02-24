# Load sentiment analysis results
# sentiment_matrix


# setwd(dirname(getwd()))
source("sentiment_analysis.R")
source("sentiment.r")
source("basic_stat3.R")

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$sentiment <- renderPlot({
    
    # Render a barplot
    barplot(sentiment_matrix[1,], 
            main="Compare among other papers",
            ylab="Sentiment score",
            xlab="Papers")
    
    # Render a barplot
    
  })
  
  # Fill in the spot we created for a plot
  output$basic_stat3 <- renderPlot({
    # Render a barplot
    barplot(YEARLY_COUNTS[,input$paper], 
            main=input$paper,
            ylab="Number of Articles",
            xlab="Year")
  })
  
}