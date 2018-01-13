# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################


source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/technicalindicators/TickerDailyReturnsNew.R")
source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/technicalindicators/TechnicalIndicators.R")

gas<-gas



d <- getYahooData("IBM", 20080101, 20100303 ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
winsize <- 30

ret <- getPeriodReturnSignals(d,"daily",2,4)
rsi <- getRsiSignals(d)


b <- getBolingerBandsSignals(d)
m <- getMultiSmaSignals(d)

listOfCompanies <- c("AAPL","MSFT","INTC","JPM","WFC","BAC","C","XOM","VLO","CVX")

for(i in 1:nrow(listOfCompanies))
{
	symbol <- listOfCompanies[i]
	#tickerOHLC <- getYahooData(tickerSymbol, trainStartDate, trainEndDate ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)	
}