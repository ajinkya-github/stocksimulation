# TODO: Add comment
# 
# Author: ajinkya
###############################################################################



getBolingerBandsSignals <- function(ticker) 
{
	ticker.bbands <- BBands( ticker[,"Close"] )
	ticker.moneyflowindex <- MFI(ticker[,c("High","Low","Close")], ticker[,"Volume"])
	
	ticker.bbands.signals <- nrow(ticker)
	n<-nrow(ticker)
	
	for(i in 50:n)
	{
		
		if(ticker.bbands[i,"pctB"] > 0.80 && ticker.moneyflowindex[i,"mfi"] > 80 && ticker.moneyflowindex[i-1,"mfi"] < 80 )
		{	
			#print("buy")
			ticker.bbands.signals[i] <- "buy"
		}
		else if(ticker.bbands[i,"pctB"] < 0.20 && ticker.moneyflowindex[i,"mfi"] < 20 && ticker.moneyflowindex[i-1,"mfi"] > 20 )
		{	
			#print("sell")
			ticker.bbands.signals[i] <- "sell"
		}
		else
		{
			#print("hold")
			ticker.bbands.signals[i] <- "hold"
		}
		
	}
	
	result <- data.frame(ticker.bbands.signals,ticker.bbands,ticker.moneyflowindex)
	return(result)
}

