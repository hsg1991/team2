# Load sentiment analysis results
# sentiment_matrix


# setwd(dirname(getwd()))
source("sentiment_analysis.R")
source("sentiment.R")
source("basic_stat3.R")
source("wordcloud.R")

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
  
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
      })
    })
  })
  
  # wordcloud
  wordcloud_rep <- repeatable(wordcloud)
  
  output$wordCloud <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
  
  #plot showing number of articles per paper
  output$histogram <- renderPlot({
    # Render a barplot
    barplot(height=papersArticleCountDF[,2],
            names.arg=papersArticleCountDF[,1],
            ylab="Number of Telephones",
            xlab="Year")
  })
  
}