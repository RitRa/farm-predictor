#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

# my favourite libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# import the data

cowprice = read.csv(file ="~/Dropbox/Study/github/farm-predictor/cow_price/data/cow_prices.csv")

str(cowprice)

# 2. Linear Regression in R
summary(cowprice)
#

modelReg = lm(price ~ weight, data=cowprice)

#predicted_df <- data.frame(price_pred = predict(modelReg, newdata=cowprice), weight=cowprice$weight)


# predict teh 
#cowweight = read.csv(file ="~/Dropbox/Study/github/farm_predictor/cow_weight.csv")


#predicted_df <- predict(modelReg, newdata=cowweight) 


#predicted_df <- data.frame(price_pred = predict(modelReg, newdata=cowweight), weight=cowweight$weight)



library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Prediction
    pricedata <- reactive({
        data.frame(weight=input$weight)
    })
    
    predictTest <- reactive({
        predict(modelReg,pricedata())
        
    })
    
    output$predictTest <- renderTable({
        predictTest()
    })
    
    
    
    # output$predictTest2<- renderPrint({
    #    predictTest()
    #    
    # })

    #ggplot of real data
    output$cowPlot <- renderPlot({

    cowprice %>% 
        ggplot2::ggplot(aes(weight, price)) + 
        geom_point() +
        stat_smooth(method = "lm", col = "blue") +
        labs(title = "Data: Cow Weight vs Prices", 
             subtitle = "Using this data to predict cow prices using linear modelling", 
             caption = "Data taken From 08 Feb 2021") +
        theme(
                legend.position = c(0.95, 0.95),
                legend.justification = c("right", "top"),
                plot.title = element_text(face = "bold"),
                plot.caption = element_text(face = "italic")
            )

    })
    


    #table of real data
    output$table <- DT::renderDataTable({
        DT::datatable(cowprice)
    })
    
    #summary and model
    output$summary <- renderPrint({
        summary(cowprice)
      
    })
    output$model <- renderPrint({
      
        summary(modelReg)
    })
    
  

})
