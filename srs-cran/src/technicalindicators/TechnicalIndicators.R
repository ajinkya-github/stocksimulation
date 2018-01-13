# TODO: Add comment
# 
# Author: ajinkyapatil
###############################################################################



rm(list = ls())

increment<- function(x){x+1}
decrement<- function(x){x-1}


################################################################################


getPeriodReturnSignals <- function(ticker,timeFrequency,percent) 
{	
	percent.absolute <- (percent/100)
	print(percent.absolute)
	print(" calculating daily return signals ")
 	ticker.return <- dailyReturn(ticker[,"Close"], subset=NULL, type='arithmetic', leading=TRUE)
	
	# ticker.return.percent <- Delt(ticker.return,type="arithmetic")
	ticker.return.signals <- (nrow(ticker))
	
	print(" calculating daily return signals ")
	
	print(nrow(ticker.return.signals))
	print(nrow(ticker))
	n<-nrow(ticker)
	
	for(i in 1:n)
	{
		#ticker.return.signals[i] <- ifelse(percent.absolute < ticker.return[i],"Buy","Sell")
		
		if(ticker.return[i] > percent.absolute)
		{
			#print("buy")
			ticker.return.signals[i] <- "buy"
		}
		else if(ticker.return[i] < -percent.absolute)
		{	
			#print("sell")
			ticker.return.signals[i] <- "sell"
		}
		else
		{
			#print("hold")
			ticker.return.signals[i] <- "hold"
		}
		
		
	}
	t<-ticker[,"Close"]
	result <-data.frame(ticker.return.signals,t,ticker.return)
	return(result)
}

###############################################################################


getSmaSignals <- function(ticker,avg.period)
{
	ticker.sma <- SMA(ticker[,"Close"], avg.period)
	ticker.close <- ticker[,"Close"]
	ticker.open <- ticker[,"Open"]
	
	ticker.sma.signals <- (nrow(ticker))
	
	tdi <- TDI(ticker[,"Close"], n=avg.period)  # trend 
	x<-0
	y<-0
	z<-0
	n <- nrow(ticker)	
	for(i in avg.period:n)
	{

		if((ticker.open[i] < ticker.sma[i]) && (ticker.close[i] > ticker.sma[i]) && tdi[i,"di"] > 0)
		{
			x<- increment(x)
			ticker.sma.signals[i] <- "buy"
		}
		else if(ticker.open[i] > ticker.sma[i] && ticker.close[i] < ticker.sma[i] && tdi[i,"di"] < 0)
		{	
			y<- increment(y)
			ticker.sma.signals[i] <- "sell"
		}
		else
		{
			z<- increment(z)
			ticker.sma.signals[i] <- "hold"
		}
	}
	
	result <- data.frame(ticker.open, ticker.sma, ticker.close, ticker.sma.signals,tdi)
	return(result)
}


################################################

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

################################################


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

################################################


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
				rec <- "buy"
			}
			else if(diff.preventry > 0 && diff.currententry <0)
			{	
				#print("sell")
				rec <- "sell"
			}
			else
			{
				#print("hold")
				rec <- "hold"
			}
			
		
		#print(rec1)
		ticker.multisma.signals[i] <- rec
	}
	
	result <- data.frame(ticker.multisma.signals, sma.20, sma.50)
	return(result)
}

################################################


myATR <- function(x) ATR(HLC(x))[, "atr"]


