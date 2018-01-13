# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################




getMultiSmaSignalsNew <- function(ticker,smalow,smahigh)
{
	sma.low <- SMA(ticker[,"Close"],smalow)
	sma.high <- SMA(ticker[,"Close"],smahigh)
	
	close.ticker <- ticker[,"Close"]
	open.ticker <- ticker[,"Open"]
	ticker.multisma.signals <- nrow(sma.low)
	
	n<-nrow(ticker)
	for(i in smahigh:n)
	{
		
		
		diff.preventry <- sma.low[i-1]-sma.high[i-1]
		diff.currententry <- sma.low[i]-sma.high[i]
		
		
		if(diff.preventry < 0 && diff.currententry > 0)
		{
			#print("buy")
			ticker.multisma.signals[i] <- "buy"
		}
		else if(diff.preventry > 0 && diff.currententry < 0)
		{	
			#print("sell")
			ticker.multisma.signals[i] <- "sell"
		}
		else
		{
			#print("hold")
			ticker.multisma.signals[i] <- "hold"
		}
		
		
	}
	
	result <- data.frame(ticker.multisma.signals)
	return(result)
}

