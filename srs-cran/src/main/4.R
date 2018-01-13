# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################
library(randomForest)
library(TTR)
library(forecast)
library(quantmod)

source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/technicalindicators/TickerDailyReturnAbsolute.R")
#source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/technicalindicators/TickerDailyReturnsNew.R")
#source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/technicalindicators/TechnicalIndicators.R")

gas<-gas



d <- getYahooData("IBM", 20080101, 20090303 ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
winsize <- 30

ret <- getPeriodReturnSignals(d,"daily",2)
x <- as.ts(ret$daily.returns)
fit <- auto.arima(x)
f1 <- forecast(fit,h=200)
plot(f1)


start <- 1
end <- nrow(ret)
#pred <- nrow(ret)
rm(pred)
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


predicted.price <- nrow(ret1)

# arima and random forest integration
for(i in 1:nrow(ret1))
{
	if(ret1[i,6] == "buy")
	{
		predicted.price[i] <- (ret1[i,3]+ret1[i,4])/2
	}
	if(ret1[i,6] == "hold")
	{
		predicted.price[i] <- (ret1[i,2]+ret1[i,3])/2
	}
	if(ret1[i,6] == "sell")
	{
		predicted.price[i] <- (ret1[i,1]+ret1[i,2])/2
	}
	
}

predicted.price <- round(predicted.price)

#plot(f)



#fit1 <- bats(x)
#f1<-forecast(fit1)
#plot(f1)

#fit2 <- nnetar(x)
#f2<-forecast(fit2,h=200)
#plot(f2)