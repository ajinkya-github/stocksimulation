# TODO: Add comment
# 
# Author: ajinkya
###############################################################################

#library(caret) 
library(plyr)

predictStartDate<-20120101
predictEndDate<-20131207

tickerOHLC <- getYahooData(tickerSymbol, predictStartDate, predictEndDate ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
#print(aapl)

################################################################################

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

i<-nrow(tickerTestData)
print(i)

ticker.prediction <- predict(ticker.rfmodel, tickerTestData)
check1 <- cbind(tickerTestData$daily.returns,as.character(tickerTestData$ticker.return.signals),as.character(ticker.prediction))
ticker.prediction.signals <- as.character(ticker.prediction)
		
confusionmatrix <- table(ticker.prediction, tickerTestData$ticker.return.signals)
fileExtension<- "csv"

CMFileName <- paste(tickerSymbol,"ConfusionMatrix",sep="-")
CMFileName <- paste(CMFileName,"csv",sep=".")
writeToCsv(confusionmatrix,CMFileName)


ticker.arima <- arimaPricePrediction(tickerTestData,ticker.prediction.signals)
#ticker.arima <- ceiling(ticker.arima)
		
## For loop to calculate the predicted prices
ticker.close.prediction <- nrow(tickerTestData)
#ticker.prediction.values <- as.numeric(as.character(ticker.prediction))		

for(i in 1:nrow(tickerTestData))
			{
				percent <- ticker.arima[i]
				percentincrease = (percent/100)*tickerTestData$Close[i]
				ticker.close.prediction[i] =  (tickerTestData$Close[i] + percentincrease)
			}

#confusionmatrix <- confusionMatrix(ticker.prediction, tickerTestData$daily.returns)




#csvData <- data.frame(tickerTestData$ticker.return.signals,tickerTestData$daily.returns,ticker.arima,ticker.close.prediction,tickerTestData$Close,
#		tickerTestData$Open,tickerTestData$High,tickerTestData$Low, 
#		tickerTestData$Volume,tickerTestData$Close.SMA.20,tickerTestData$Close.SMA.50,
#		tickerTestData$dn,tickerTestData$up,tickerTestData$mavg,tickerTestData$pctB,tickerTestData$mfi)

ticker.arima1 <- (ticker.arima)
csvData <- data.frame(ticker.arima1,ticker.close.prediction,tickerTestData)

#csvData <- data.frame(tickerTestData$ticker.return.signals,tickerTestData$daily.returns,d[,1],ticker.close.prediction,tickerTestData$Close,
#		tickerTestData$Open,tickerTestData$High,tickerTestData$Low, 
#		tickerTestData$Volume,tickerTestData$Close.SMA.20,tickerTestData$Close.SMA.50,
#		tickerTestData$dn,tickerTestData$up,tickerTestData$mavg,tickerTestData$pctB,tickerTestData$mfi)


print("renaming column names")

names(csvData)[names(csvData)=="ticker.close.prediction"] <- "predicted price"
names(csvData)[names(csvData)=="daily.returns"] <- "actual returns %"

#this is not required
#names(csvData)[names(csvData)=="ticker.prediction"] <- "predicted returns %"

names(csvData)[names(csvData)=="ticker.arima1"] <- "predicted returns %"
names(csvData)[names(csvData)=="ticker.return.signals"] <- "recommendation signals"
names(csvData)[names(csvData)=="Open"] <- "open"
names(csvData)[names(csvData)=="High"] <- "high"
names(csvData)[names(csvData)=="Low"] <- "low"
names(csvData)[names(csvData)=="Close"] <- "close"
names(csvData)[names(csvData)=="Volume"] <- "volume"
names(csvData)[names(csvData)=="Close.SMA.20"] <- "20 day sma"
names(csvData)[names(csvData)=="Close.SMA.50"] <- "50 day sma"
names(csvData)[names(csvData)=="dn"] <- "lower bband "
names(csvData)[names(csvData)=="up"] <- "higher bband"
names(csvData)[names(csvData)=="mavg"] <- "mavg"
names(csvData)[names(csvData)=="pctB"] <- "bband pctb"
names(csvData)[names(csvData)=="mfi"] <- "money flow index"

fileExtension<- "csv"
csvFileName <- paste(tickerSymbol,fileExtension,sep=".")
writeToCsv(csvData, csvFileName)

warnings()
