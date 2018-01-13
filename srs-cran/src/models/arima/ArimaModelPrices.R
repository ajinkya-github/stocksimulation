# TODO: Add comment
# 
# Author: ajinkya
library(forecast)



arimaPricePrediction <- function(ret,predictionsignals)
{

winsize <- 30


x <- as.ts(ret$daily.returns)

start <- 1
end <- nrow(ret)
pred <- nrow(ret)

pred <-NULL

for(i in 1:nrow(ret)+1)
{
	index <- start + winsize
	window <- ret[start:index,]
	x <- as.ts(window$daily.returns)
	fit <- auto.arima(x)
	f <- forecast(fit,h=1)
	
	predictedrange <- cbind(f$lower,f$upper,f$mean)
	pred<- rbind(pred,predictedrange)
	
	start <- start + 1
	index <- index + 1
}

ret1 <- as.data.frame(cbind(pred,ret))


for(i in 1:4)
{
	ret1[,i] <- (round(ret1[,i]))
}


predicted.price.percent <- nrow(ret1)

# arima and random forest integration
for(i in 1:nrow(ret1))
{
	if(predictionsignals[i] == "buy")
	{
		predicted.price.percent[i] <- (ret1[i,3]+ret1[i,4])/2
	}
	if(predictionsignals[i] == "hold")
	{
		predicted.price.percent[i] <- (ret1[i,2]+ret1[i,3])/2
	}
	if(predictionsignals[i] == "sell")
	{
		predicted.price.percent[i] <- (ret1[i,1]+ret1[i,2])/2
	}
	
}


return (predicted.price.percent)

# code below is retired as of now.
#plot(f)

#fit1 <- bats(x)
#f1<-forecast(fit1)
#plot(f1)

#fit2 <- nnetar(x)
#f2<-forecast(fit2,h=200)
#plot(f2)
	
}