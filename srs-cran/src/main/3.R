# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################



library(multicore)

x <- 1:10000
now1 <- Sys.time()
pv <- pvec(x, sqrt)
now2 <- Sys.time()
now3 <- now2-now1
pv<- sqrt(x)
		#stopifnot(all(pv == sqrt(1:10)))
now4 <- Sys.time()
now5 <- now4-now2


