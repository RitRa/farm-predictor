# Predict the price of a cow

# my favourite libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# import the data

cowprice = read.csv(file ="~/Dropbox/Study/github/predict_cow_price/cow_prices.csv")

str(cowprice)


# 2. Linear Regression in R
summary(cowprice)

# basic plot
plot(cowprice$weight, cowprice$price)


#using ggplot
cowprice %>% 
  ggplot2::ggplot(aes(weight, price)) + 
  geom_point() 

# We next attempt to create a simple linear regression model 
# using only the weight, to predict the cow price.

modelReg = lm(price ~ weight, data=cowprice)
summary(modelReg)

# the variable name before the ~ symbol is the dependent variable, 
# and the variable name after the ~ symbol is the independent variable


# time to preict
cowweight = read.csv(file ="~/Dropbox/Study/github/predict_cow_price/cow_weight.csv")


predictTest = predict(modelReg, newdata=cowweight)
predictTest





