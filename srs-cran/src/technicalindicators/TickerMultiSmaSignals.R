# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################




getMultiSmaSignals <- function(ticker)
{
	sma.20 <- SMA(ticker[,"Close"],20)
	sma.50 <- SMA(ticker[,"Close"],50)
	
	close.ticker <- ticker[,"Close"]
	open.ticker <- ticker[,"Open"]
	ticker.multisma.signals <- nrow(sma.20)
	
	n<-nrow(ticker)
	for(i in 55:n)
	{
		
		
		diff.preventry <- sma.20[i-1]-sma.50[i-1]
		diff.currententry <- sma.20[i]-sma.50[i]
		
		
		if(diff.preventry < 0 && diff.currententry >0)
		{
			#print("buy")
			ticker.multisma.signals[i] <- "buy"
		}
		else if(diff.preventry > 0 && diff.currententry <0)
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
	
	result <- data.frame(ticker.multisma.signals, sma.20, sma.50)
	return(result)
}

