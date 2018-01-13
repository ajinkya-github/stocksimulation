# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################

#ticker <- getYahooData("IBM", 20120101, 20131111 ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)

#tdi <- TDI(ticker[,"Close"], n=20)  # trend 

#d <- data.frame(ticker.arima1,tickerTestData)

v <- 89
rm(list=(ls()[ls()!="ticker.rfmodel"]))


x <- rnorm(3)
lvl <- c("a","b","c")
df1 <- factor(x, lvl)
str(df)


lvl <- c("a","b","c","d")
df <- factor(df1, lvl)
str(df)
