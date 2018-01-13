# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################



library(randomForest)
library(quantmod)
library(TTR)
library(tseries)
library(multicore)

closeAllConnections()
memory.limit(size=2566)

now1 <- Sys.time()


tickerdata <- cbind(smaMultiSmaSignal,tickerDailySignal,smaSignal,bbandSignal,rsiSignal)

row.has.na <- apply(tickerdata, 1, function(x){any(is.na(x))})
sum(row.has.na)
tickerdata <- tickerdata[!row.has.na,]
print("removing rows containing NA")

tickerdata$ticker.multisma.signals <- droplevels(tickerdata$ticker.multisma.signals)
tickerdata$ticker.return.signals <- droplevels(tickerdata$ticker.return.signals)
tickerdata$ticker.return.factors <- droplevels(tickerdata$ticker.return.factors)
tickerdata$ticker.sma.signals <- droplevels(tickerdata$ticker.sma.signals)
tickerdata$ticker.bbands.signals <- droplevels(tickerdata$ticker.bbands.signals)
tickerdata$ticker.rsi.signals <- droplevels(tickerdata$ticker.rsi.signals)
print("dropping unused levels")



tickerTrainData <- tickerdata

ticker.rfmodel <- randomForest(ticker.return.factors ~ ., data=tickerTrainData, ntree = 10000 ,importance = TRUE, na.action = na.omit )
print(ticker.rfmodel)
print(round(importance(ticker.rfmodel), 2))



sink("/Users/ajinkyaingale/srs-cran/src/output3.txt",append=TRUE, split=FALSE)
now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))


