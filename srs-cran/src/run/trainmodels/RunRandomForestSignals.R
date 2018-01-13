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

source("/Users/ajinkyaingale/srs-cran/src/utils/RemoveAll.R")

source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerBBandsSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerDailyReturns.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerMultiSmaSignals.R")
source("/Users/ajinkyaingale/src-cran/src/technicalindicators/TickerRsiSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerSmaSignals.R")

source("/Users/ajinkyaingale/srs-cran/src/utils/IDOperator.R")
source("/Users/ajinkyaingale/srs-cran/src/persistence/CsvPersistence.R")

source("/Users/ajinkyaingale/srs-cran/src/etl/Load.R")

source("/Users/ajinkyaingale/srs-cran/src/models/randomforest/RandomForestModelSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/run/testmodels/PredictTickerSignals.R")

now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))




