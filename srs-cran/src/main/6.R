# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################


#listOfCompanies <- c("AAPL","MSFT","INTC","JPM","WFC","BAC","C","XOM","VLO","CVX","JNJ","PFE","AIQ")

x <- data.frame(10)
unlink("csvfolder", recursive = TRUE, force = TRUE)
dir.create("csvfolder")
pt <- file.path("csvfolder", "example.csv")
writeToCsv(csvData, pt)



for(i in 1:10)
{
	#symbol <- listOfCompanies[i]
	#tickerOHLC <- getYahooData(tickerSymbol, trainStartDate, trainEndDate ,freq="daily", type="price", adjust=TRUE, quiet=FALSE)	
}
