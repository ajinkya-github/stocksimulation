# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################



getPeriodReturnSignals <- function(ticker,timeFrequency,percent) 
{	
	#percent.absolute <- (percent/100)
	percent.absolute <- percent
	print(percent.absolute)
	print(" calculating daily returns ")
	
	ticker.return <- dailyReturn(ticker[,"Close"], subset=NULL, type='arithmetic', leading=TRUE)
	
	for(k in 1:nrow(ticker.return))
	{
		ticker.return[k] <- ticker.return[k] * 100
	}
	print(" calculated percent daily returns ")
	
	
	#rounding the returns. Do not undo this rounding or it will mess up ticker.return.factors
	ticker.return <- round(ticker.return)
	
	
	# ticker.return.percent <- Delt(ticker.return,type="arithmetic")
	ticker.return.signals <- (nrow(ticker.return))
	
	print(" ticker.return.signals")
	
	print(nrow(ticker.return.signals))
	
	print(" calculating daily return signals ")
	
	
	print(" ticker ")
	print(nrow(ticker))
	n<-nrow(ticker)
	
	
	for(i in 2:n)
	{
	
		#ticker.return.signals[i] <- ifelse(percent.absolute < ticker.return[i],"Buy","Sell")
		
		if(ticker.return[i] > percent.absolute)
		{
			#print("buy")
			ticker.return.signals[i-1] <- "buy"
			
		}
		else if(ticker.return[i] < -percent.absolute)
		{	
			#print("sell")
			ticker.return.signals[i-1] <- "sell"
		}
		else
		{
			#print("hold")
			ticker.return.signals[i-1] <- "hold"
		}
		
		##TODO : ADDED ONLY TO MAKE ROWS EQUAL  
		    ticker.return.signals[i] <- "hold"
		
	}
	print(" ticker.return.signals ")
	print(nrow(ticker.return.signals))
	
	## ADJUSTING COLUMN OF PREDICTED % RETURNS COLUMN BY MOVING ALL ENTRIES BY 1 DAY
	n <- nrow(ticker.return)
	ticker.return.adjusted <- as.numeric(n)
	for(i in 1:nrow(ticker.return)-1)
		{
			ticker.return.adjusted[i] <- ticker.return[i+1]
		}
		ticker.return.adjusted[n] <- ticker.return[n]
	
	ticker.return.factors <- factor(ticker.return.adjusted,levels=c(-9:10))
	print(" ticker.return.factors ")
	print(nrow(ticker.return.factors))
	
	result <-data.frame(ticker.return.signals,ticker.return,ticker.return.factors,ticker$Open,ticker$Close,ticker$High,ticker$Low,ticker$Volume)
	return(result)
}
