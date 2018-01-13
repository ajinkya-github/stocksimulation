# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################
library(randomForest)
library(multicore)


pv <- pvec(1:1000, sqrt)
stopifnot(all(pv == sqrt(1:1000)))

x <- c(1,2,9,3,9,3)
levels=c(1,2,9,3)
f1 <- factor(x,levels)
f2 <- factor(c(1,9,9,9,3,2),levels)
d <- data.frame(f1,f2,x)


levels=c(1,2,9,3,0)
f11 <- factor(c(1,0,0,0,0,0),levels)
f22 <- factor(c(0,0,0,0,0,0),levels)
yz <- data.frame(f11,f22,c(0,0,0,0,0,0))


rf <- randomForest(f1 ~ x+f2, data=d, ntree = 100 ,importance = TRUE, na.action = na.omit )
print(rf)
#print(round(importance(rf), 2))

############
p <- predict(rf,yz)
#res <- table(tickerTestData$ticker.return.signals, ticker.prediction)
