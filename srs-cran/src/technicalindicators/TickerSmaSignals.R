# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################




getSmaSignals <- function(ticker,avg.period)
{
	ticker.sma <- SMA(ticker[,"Close"], avg.period)
	ticker.close <- ticker[,"Close"]
	ticker.open <- ticker[,"Open"]
	
	ticker.sma.signals <- (nrow(ticker))
	
	tdi <- TDI(ticker[,"Close"], n=avg.period)  # trend 
	
	n <- nrow(ticker)	
	for(i in avg.period:n)
	{
		
		if((ticker.open[i] < ticker.sma[i]) && (ticker.close[i] > ticker.sma[i]) && tdi[i,"di"] > 0)
		{
			ticker.sma.signals[i] <- "buy"
		}
		else if(ticker.open[i] > ticker.sma[i] && ticker.close[i] < ticker.sma[i] && tdi[i,"di"] < 0)
		{	
			ticker.sma.signals[i] <- "sell"
		}
		else
		{
			ticker.sma.signals[i] <- "hold"
		}
	}
	
	#commented due to tdi includes 2 cols tdi &di which creates duplicates in tickerdata
	#result <- data.frame(ticker.sma.signals,tdi)
	result <- data.frame(ticker.sma.signals)
	
	
	return(result)
}

