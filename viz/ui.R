# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

setwd(dirname(getwd()))
source("basic_stat3.R")


navbarPage("TEAM2",
           navbarMenu("Exploratory investigation",
                      
                      tabPanel("Word Cloud"),
                      
                      tabPanel("Articles / Paper"),
                      
                      tabPanel("Articles / Year", 
                               sidebarLayout(      
                                 
                                 # Define the sidebar with one input
                                 sidebarPanel(
                                   selectInput("paper", "Paper:", 
                                               choices=colnames(YEARLY_COUNTS)),
                                   hr(),
                                   helpText("Yearly counts of article")
                                 ),
                                 
                                 # Create a spot for the barplot
                                 mainPanel(
                                   plotOutput("basic_stat3")  
                                 )
                                 
                               ))),
           
           tabPanel("Topic modeling"),
           
           tabPanel("Sentiment analysis",
                    titlePanel("Sentiment analysis results!"),
                    sidebarPanel(
                            helpText("Sentiment analysis Explanations")
                            # selectInput("region", "Region:",
                            #             choices=colnames(WorldPhones)),
                            # hr(),
                            # helpText("Data from AT&T (1961) The World's Telephones.")
                          ),

                          # Create a spot for the barplot
                          mainPanel(
                            plotOutput("sentiment")
                          )
                    )
)

# # Use a fluid Bootstrap layout
# fluidPage(    
#   
#   # Give the page a title
#   titlePanel("Sentiment analysis results!"),
#   
#   # Generate a row with a sidebar
#   sidebarLayout(      
#     
#     # Define the sidebar with one input
#     sidebarPanel(
#       helpText("Sentiment analysis Explanations")
#       # selectInput("region", "Region:",
#       #             choices=colnames(WorldPhones)),
#       # hr(),
#       # helpText("Data from AT&T (1961) The World's Telephones.")
#     ),
#     
#     # Create a spot for the barplot
#     mainPanel(
#       plotOutput("sentiment")  
#     )
#     
#   )
# )
