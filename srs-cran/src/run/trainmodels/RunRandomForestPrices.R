# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################



library(randomForest)
library(quantmod)
library(TTR)
library(tseries)

closeAllConnections()

memory.limit(size=2566)

now1 <- Sys.time()


listOfCompanies <- c("AAPL","MSFT","INTC","JPM","WFC","BAC","C","XOM","VLO","CVX","JNJ","PFE","AIQ")

for(i in 1:10)
{
	
tickerSymbol <- listOfCompanies[i]

source("/Users/ajinkyaingale/srs-cran/src/utils/RemoveAll.R")

source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerBBandsSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerDailyReturnAbsolute.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerMultiSmaSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerRsiSignals.R")
source("/Users/ajinkyaingale/srs-cran/src/technicalindicators/TickerSmaSignals.R")

source("/Users/ajinkyaingale/srs-cran/src/persistence/CsvPersistence.R")
source("/Users/ajinkyaingale/srs-cran/src/utils/IDOperator.R")

source("/Users/ajinkyaingale/srs-cran/src/etl/Load.R")
source("/Users/ajinkyaingale/srs-cran/src/models/randomforest/RandomForestModelPrices.R")
source("/Users/ajinkyaingale/srs-cran/src/run/testmodels/PredictTickerPrices.R")

now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))

}
