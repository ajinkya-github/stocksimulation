i<-1:100
j<-101:200
df<- data.frame(i,j)
for(k in 1:nrow(df))
{
	df$i[k] <-df$i[k] * 100 + 0.11
}
df$i <- round(df$i)


tickerOHLC <- getYahooData(tickerSymbol, 20120101, 20131111 ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)
#print(aapl)

###############################################
#######################################################################

tickerDailySignal <- getPeriodReturnSignals(tickerOHLC,"daily",2)

smaMultiSmaSignal <- getMultiSmaSignals(tickerOHLC)

smaSignal <- getSmaSignals(tickerOHLC,20)

bbandSignal <- getBolingerBandsSignals(tickerOHLC)

rsiSignal <- getRsiSignals(tickerOHLC)







set.seed(100)
ind <- sample(2, nrow(df), replace=TRUE, prob=c(0.5, 0.5))
t1rainData <- df[ind==1,]
t1estData <- df[ind==2,]

x <- 1:12
# a random permutation
y<-sample(x)
# bootstrap resampling -- only if length(x) > 1 !
z<-sample(x, replace = TRUE)


#source("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/main/1.R")
#print(trainData)
#print(testData)
#sink("/Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src/sma.txt",append=TRUE, split=FALSE)

