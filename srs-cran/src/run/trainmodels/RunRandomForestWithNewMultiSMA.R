# TODO: Add comment
# 
# Author: ajinkya
###############################################################################



library(randomForest)
library(quantmod)
library(TTR)
library(tseries)

closeAllConnections()

memory.limit(size=2566)

rm(list = ls())


now1 <- Sys.time()

tickerSymbol <- "IBM"

print("Building the Model")
source("/Users/ajinkyaingale/srs-cran/src/utils/RemoveAll.R")

print("Building Technical Indicators")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerBBandsSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerDailyReturnAbsolute.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerMultiSmaSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerMultiSmaSignalsNew.R")

source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerRsiSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerSmaSignals.R")

source("/Users/ajinkyaingale/srs-cran/src/utils/IDOperator.R")
source("/Users/ajinkyaingale/srs-cran/src/persistence/CsvPersistence.R")

print("Loading the Training Data from API's")
source("/Users/ajinkyaingale/srs-cran/src/etl/Load.R")

print("Training Random Forest Model from training dataset")
source("/Users/ajinkyaingale/srs-cran/src/models/randomforest/RandomForestWithNewMultiSMA.R")

print("Training Arima Model from Training dataset")
source("/Users/ajinkyaingale/srs-cran/src/models/arima/ArimaModelPrices.R")

print("Predicting the Stocks for Test Period")
source("/Users/ajinkyaingale/srs-cran/src/run/testmodels/PredictTickerPrices.R")

print("Completed prediction for Stock for Test Period to" )
now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))




