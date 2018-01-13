# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################




getRsiSignals <- function(ticker) 
{
	rsi <- RSI(ticker[,"Close"])
	ticker.rsi.signals <- nrow(ticker)
	
	for(i in 100:nrow(ticker))
	{
		if(rsi[i,"Close.EMA.14"] < 30)
			ticker.rsi.signals[i] <- "buy"
		
		else if(rsi[i,"Close.EMA.14"] > 70)
			ticker.rsi.signals[i] <- "sell"
		
		else
			ticker.rsi.signals[i] <- "hold"	  
	}
	
	result <- data.frame(rsi,ticker.rsi.signals)
	return(result)
}

