# TODO: Add comment
# 
# Author: ajinkyapatil
###############################################################################

#this file loads the data from yahoo.finance

library(quantmod)
library(TTR)
library(tseries)

closeAllConnections()
memory.limit(size=2566)


data <- new.env()

#tickerSymbol <- "IBM"

trainStartDate<-20080101
trainEndDate<-20120101

tickerOHLC <- getYahooData(tickerSymbol, trainStartDate, trainEndDate ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)

#######################################################################

tickerDailySignal <- getPeriodReturnSignals(tickerOHLC,"daily",2)

smaMultiSmaSignal <- getMultiSmaSignals(tickerOHLC)

smaSignal <- getSmaSignals(tickerOHLC,20)

bbandSignal <- getBolingerBandsSignals(tickerOHLC)

rsiSignal <- getRsiSignals(tickerOHLC)


sink("/Users/ajinkyaingale/srs-cran/src/etl/output_etl.txt",append=TRUE, split=FALSE)


