# TODO: Add comment
# 
# Author: ajinkya
###############################################################################

library(randomForest)
library(quantmod)
library(TTR)
library(tseries)
library(pmml)

closeAllConnections()

now1 <- Sys.time()



tickerdata <- cbind(smaMultiSmaSignal,smaSignal20,smaSignal40,smaSignal50,smaSignal100,
		tickerDailySignal,bbandSignal,rsiSignal)

#renaming columns because of duplicate SMA signals
colnames(tickerdata)[4] <- 'tickersma1'
colnames(tickerdata)[5] <- 'tickersma2'
colnames(tickerdata)[6] <- 'tickersma3'
colnames(tickerdata)[7] <- 'tickersma4'




row.has.na <- apply(tickerdata, 1, function(x){any(is.na(x))})
sum(row.has.na)
tickerdata <- tickerdata[!row.has.na,]
print("removing rows containing NA")

tickerdata$ticker.multisma.signals <- droplevels(tickerdata$ticker.multisma.signals)
tickerdata$ticker.return.signals <- droplevels(tickerdata$ticker.return.signals)

tickerdata[,4] <- droplevels(tickerdata[,4])
tickerdata[,5] <- droplevels(tickerdata[,5])
tickerdata[,6] <- droplevels(tickerdata[,6])
tickerdata[,7] <- droplevels(tickerdata[,7])

tickerdata$ticker.bbands.signals <- droplevels(tickerdata$ticker.bbands.signals)
tickerdata$ticker.rsi.signals <- droplevels(tickerdata$ticker.rsi.signals)

print("dropping unused levels")

#tickerdata <- tickerdata[,-2] # duplicate column

#set.seed(100)
#ind <- sample(2, nrow(tickerdata), replace=TRUE, prob=c(0.7, 0.3))
#tickerTrainData <- tickerdata[ind==1,]
#tickerTestData <- tickerdata[ind==2,]
##################
tickerTrainData <- tickerdata



ticker.rfmodel <- randomForest(ticker.return.signals ~ ., data=tickerTrainData, ntree = 10000 ,importance = TRUE, na.action = na.omit )
print(ticker.rfmodel)
print(round(importance(ticker.rfmodel), 2))

#pmmlDescription <- paste(tickerSymbol," Random Forest Tree Model ",sep=" ")	
#pmml(ticker.rfmodel, model.name="randomForest_Model", app.name="Rattle/PMML",description=pmmlDescription)


#ticker.prediction <- predict(ticker.rfmodel, tickerTestData)
#res <- data.frame(tickerTestData$ticker.return.signals, ticker.prediction)
#writeToCsv(res,"recommendation.csv")


#test2013data <- getYahooData("AAPL", 20130101, 20131111 ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
#ticker.2013 <- getPeriodReturnSignals(test2013data, "daily", 2)
#ticker.prediction.2013 <- predict(ticker.rfmodel, test2013data)

#testrows <- round((nrow(tickerdata))*0.9)
#newtestdata <- tickerdata[-1:-testrows,]
#ticker.prediction.2013 <- predict(ticker.rfmodel, newtestdata)
#res2013 <- data.frame(newtestdata$ticker.return.signals, ticker.prediction.2013)





#csvData <- data.frame(newtestdata$Close, ticker.prediction.2013)
#fileExtension<- "csv"
#csvFileName <- paste(tickerSymbol,fileExtension,sep=".")
#writeToCsv(csvData,csvFileName)


now2 <- Sys.time()

print(difftime(now2,now1,unit="sec"))

