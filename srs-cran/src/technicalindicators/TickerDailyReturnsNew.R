# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################



getPeriodReturnSignals <- function(ticker,timeFrequency,percentLow, percentHigh) 
{	
	#percent.absolute <- (percent/100)
	#percent.absolute <- percent
	#print(percent.absolute)
	
	print(" calculating daily returns ")
	ticker.return <- dailyReturn(ticker[,"Close"], subset=NULL, type='arithmetic', leading=TRUE)
	
	for(k in 1:nrow(ticker.return))
	{
		ticker.return[k] <- ticker.return[k] * 100
	}
	print(" calculated percent daily returns ")
	
	#rounding the returns
	#ticker.return <- round(ticker.return)
	
	
	# ticker.return.percent <- Delt(ticker.return,type="arithmetic")
	ticker.return.signals <- (nrow(ticker.return))
	
	print(" ticker.return.signals")
	
	print(nrow(ticker.return.signals))
	
	print(" calculating daily return signals ")
	
	
	print(" ticker ")
	print(nrow(ticker))
	n<-nrow(ticker)
	
	
	for(i in 2:n) # CHANGED FROM (2:n)
	{
		
		#ticker.return.signals[i] <- ifelse(percent.absolute < ticker.return[i],"Buy","Sell")
		
		if(percentLow < ticker.return[i] && ticker.return[i] < percentHigh)
		{
			#print("buy")
			ticker.return.signals[i-1] <- "buy"
			
		}
		else if( -percentLow > ticker.return[i]  && ticker.return[i] > -percentHigh)
		{	
			#print("sell")
			ticker.return.signals[i-1] <- "sell"
		}
		else if( ticker.return[i] > percentHigh)
		{	
			ticker.return.signals[i-1] <- "strong buy"
		}
		else if( ticker.return[i] < -percentLow)
		{	
			ticker.return.signals[i-1] <- "strong sell"
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
	
	#commented 7dec13
	#result <-data.frame(ticker.return.signals,ticker.return,ticker.return.factors,ticker$Open,ticker$Close,ticker$High,ticker$Low,ticker$Volume)
	result <-data.frame(ticker.return.signals,ticker.return,ticker$Open,ticker$Close,ticker$High,ticker$Low,ticker$Volume)
	
	return(result)
}
