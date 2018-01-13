# TODO: Add comment
# 
# Author: ajinkyaingale
###############################################################################

# filename should be a string eg . "example.csv"
writeToCsv <- function(x, filename)
{
	write.table(x, file = filename, sep = ",", col.names = TRUE, row.names = TRUE, qmethod = "double")
}
