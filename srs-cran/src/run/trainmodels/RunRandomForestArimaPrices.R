# TODO: Add comment
# 
# Author: ajinkya
###############################################################################



library(randomForest)
library(quantmod)
library(TTR)
library(tseries)
#library(gdata)


closeAllConnections()

memory.limit(size=2566)

#---- use this code only if you want to iterate over companiew
#listOfCompanies <- c("AAPL","IBM","AMZN","GOOG","C","DB","MS","CVX","GE")
#for(counter in 8:9)
#{
#rm(list=(ls()[ls()!="listOfCompanies"]["counter"]))
#setwd("/Users/ajinkyaingale/srs-cran/data")
#tickerSymbol <- listOfCompanies[counter]
#----

now1 <- Sys.time()


tickerSymbol <- "AMZN"

print("Building the Model")
source("/Users/ajinkyaingale/srs-cran/src/utils/RemoveAll.R")

print("Building Technical Indicators")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerBBandsSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerDailyReturnAbsolute.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerMultiSmaSignals.R")

source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerRsiSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerSmaSignals.R")

source("/Users/ajinkyaingale/srs-cran/src/utils/IDOperator.R")
print("Loading the Training Data from API's")
source("/Users/ajinkyaingale/srs-cran/src/etl/Load.R")

print("Training Random Forest Model from training dataset")
source("/Users/ajinkyaingale/srs-cran/src/models/randomforest/RandomForestModelSignals.R")

print("Training Arima Model from Training dataset")
source("/Users/ajinkyaingale/srs-cran/src/models/arima/ArimaModelPrices.R")

print("Predicting the Stocks for Test Period")
source("/Users/ajinkyaingale/srs-cran/src/run/testmodels/PredictTickerPrices.R")

print("Completed prediction for Stock for Test Period to" )
now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))

#}  




