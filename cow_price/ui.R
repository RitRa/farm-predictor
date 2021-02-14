#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
# Define UI for application that draws a histogram
# shinyUI(fluidPage(
# 
#     # Application title
#     titlePanel("Predict cow prices"),
# 
#     # Sidebar with a slider input for number of bins
#     sidebarLayout(
#         
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#             plotOutput("cowPlot")
#         )
#         
#     )
# ))


shinyUI(fluidPage(
navbarPage("Farm Predictor ",
           tabPanel("Cow PredictPlot",
                    sidebarLayout(
                        
                        sidebarPanel(
                            img(src = "watercolor-cow.jpg", height = "100%", width = "100%"),
                            numericInput(inputId='weight', label='Add Cow Weight (kg)', value = "500"),
                            
                            textOutput("selected_var"),
                            tableOutput("predictTest")
                          
                        ),
                        mainPanel(
                            plotOutput("cowPlot"),
                            plotOutput("plot")
                        )
                    )
           ),
           tabPanel("Calf Predictor", 
                    sidebarLayout(
                        sidebarPanel(
                            img(src = "calf.jpg", height = "100%", width = "100%"),
                        ),
                        mainPanel()
                    )
                        
                    ),
           
           tabPanel("Summary",
                    includeMarkdown("rmarkdown.rmd"),
                    verbatimTextOutput("summary"),
                    verbatimTextOutput("model")
                   
           ),
           
           navbarMenu("More",
                      tabPanel("Table",
                               DT::dataTableOutput("table")
                       ),
                       tabPanel("About",
                                fluidRow(
                      #              column(6,
                      #                     includeMarkdown("about.md")
                      #              ),
                      #              column(3,
                      #                     img(class="img-polaroid",
                      #                         src=paste0("http://upload.wikimedia.org/",
                      #                                    "wikipedia/commons/9/92/",
                      #                                    "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                      #                     tags$small(
                      #                         "Source: Photographed at the Bay State Antique ",
                      #                         "Automobile Club's July 10, 2005 show at the ",
                      #                         "Endicott Estate in Dedham, MA by ",
                      #                         a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                      #                           "User:Sfoskett")
                       #                   )
                                    )
                               )
                      )
           )
)

)
