corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  cor.result = numeric()
  results<-complete(directory, id = 1:332)
  results.threshold = subset(results, nobs >= threshold)
  if( nrow(results.threshold) >= 1 ){
    for(i in 1:nrow(results.threshold)){
      fileList<-paste(directory, "/", sprintf("%03d", results.threshold$id[i]), ".csv", sep="")
      dataList <- read.csv(fileList)
      fullDataSets <- subset(dataList, !is.na(sulfate) & !is.na(nitrate)) 
      cor.result[i]<- cor(fullDataSets$sulfate, fullDataSets$nitrate) 
    }
  }
  cor.result
}