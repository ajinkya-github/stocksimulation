# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################





tickerOHLC <- getYahooData(tickerSymbol, predictStartDate, predictEndDate ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
#print(aapl)

#######################################################################

tickerDailySignal <- getPeriodReturnSignals(tickerOHLC,"daily",2)
smaMultiSmaSignal <- getMultiSmaSignals(tickerOHLC)
smaSignal <- getSmaSignals(tickerOHLC,20)
bbandSignal <- getBolingerBandsSignals(tickerOHLC)
rsiSignal <- getRsiSignals(tickerOHLC)

tickerTestData <- cbind(smaMultiSmaSignal,tickerDailySignal,smaSignal,bbandSignal,rsiSignal)

row.has.na <- apply(tickerTestData, 1, function(x){any(is.na(x))})
sum(row.has.na)
tickerTestData <- tickerTestData[!row.has.na,]
print("removing rows containing NA from test data")


tickerTestData$ticker.multisma.signals <- droplevels(tickerTestData$ticker.multisma.signals)
tickerTestData$ticker.return.signals <- droplevels(tickerTestData$ticker.return.signals)
tickerTestData$ticker.sma.signals <- droplevels(tickerTestData$ticker.sma.signals)
tickerTestData$ticker.bbands.signals <- droplevels(tickerTestData$ticker.bbands.signals)
tickerTestData$ticker.rsi.signals <- droplevels(tickerTestData$ticker.rsi.signals)
print("dropping unused levels")


i<-nrow(tickerTestData)
print(i)
ticker.prediction <- predict(ticker.rfmodel, tickerTestData)

confusionmatrix <- table(ticker.prediction, tickerTestData$ticker.return.signals)

print("print csv")


csvData <- data.frame(tickerTestData$ticker.return.signals, ticker.prediction, 
		tickerTestData$Open,tickerTestData$High,tickerTestData$Low,tickerTestData$Close, 
		tickerTestData$Close.SMA.20,tickerTestData$Close.SMA.50,tickerTestData$dn,tickerTestData$up,
		tickerTestData$mavg,tickerTestData$pctB,tickerTestData$mfi)

fileExtension<- "csv"
print("paste csv")

csvFileName <- paste(tickerSymbol,fileExtension,sep=".")
writeToCsv(csvData,csvFileName)
print("printed csv")

