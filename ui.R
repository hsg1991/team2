# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

#setwd(dirname(getwd()))
source("basic_stat3.R")
source("wordcloud.R")


navbarPage("TEAM2",
           navbarMenu("Exploratory investigation",
                      
                      tabPanel("Word Cloud",
                               # Application title
                               titlePanel("Word Cloud"),
                               sidebarLayout(
                                 # Sidebar with a slider and selection inputs
                                 sidebarPanel(
                                   selectInput("selection", "Choose a newspaper:",
                                               choices = papers),
                                   actionButton("update", "Change"),
                                   hr(),
                                   sliderInput("freq",
                                               "Minimum Frequency:",
                                               min = 1,  max = 50, value = 15),
                                   sliderInput("max",
                                               "Maximum Number of Words:",
                                               min = 1,  max = 300,  value = 100)
                                 ),
                                 
                                 # Show Word Cloud
                                 mainPanel(
                                   plotOutput("wordCloud")
                                 )
                               )
                               ),
                      
                      tabPanel("Number of articles / Paper",
                               sidebarLayout(      
                                 
                                 # Define the sidebar with one input
                                 sidebarPanel(
                                   # selectInput("paper", "Paper:", 
                                   #             choices=colnames(YEARLY_COUNTS)),
                                   # hr(),
                                   helpText("Number of articles / paper")
                                 ),
                                 
                                 # Create a spot for the barplot
                                 mainPanel(
                                   plotOutput("histogram")  
                                 )
                               )
                               ),
                      
                      tabPanel("Number of articles / Year", 
                               sidebarLayout(      
                                 
                                 # Define the sidebar with one input
                                 sidebarPanel(
                                   selectInput("paper", "Choose a newspaper:", 
                                               choices=colnames(YEARLY_COUNTS)),
                                   hr(),
                                   helpText("Yearly counts of articles in each of the newspapers.")
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
                            helpText("Sentiment analysis of articles categorised as related to envrionment and with the word 'disaster' in title.")
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
