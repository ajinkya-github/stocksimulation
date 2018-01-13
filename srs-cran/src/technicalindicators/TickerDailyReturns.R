# TODO: Add comment
# 
# Author: ajinkya
###############################################################################



getPeriodReturnSignals <- function(ticker,timeFrequency,percent) 
{	
	#percent.absolute <- (percent/100)
	percent.absolute <- percent
	print(percent.absolute)
	print(" calculating daily return signals ")
	ticker.return <- dailyReturn(ticker[,"Close"], subset=NULL, type='arithmetic', leading=TRUE)
	
	for(k in 1:nrow(ticker.return))
	{
		ticker.return[k] <- ticker.return[k] * 100
	}
	print(" calculated percent daily returns ")
	#rounding the returns
	#ticker.return <- round(ticker.return)
	# ticker.return.percent <- Delt(ticker.return,type="arithmetic")
	ticker.return.signals <- (nrow(ticker))
	
	print(" calculating daily return signals ")
	
	print(nrow(ticker.return.signals))
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
		    ticker.return.signals[i] <- "hold"
		
		
	}
	t<-ticker[,"Close"]
	
	#edited:7dec13 removed   "ticker.return.factors"
	#result <-data.frame(ticker.return.signals,ticker.return,ticker.return.factors,ticker$Open,ticker$Close,ticker$High,ticker$Low,ticker$Volume)
	result <-data.frame(ticker.return.signals,ticker.return,ticker$Open,ticker$Close,ticker$High,ticker$Low,ticker$Volume)
	return(result)
}
