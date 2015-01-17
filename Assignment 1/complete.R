complete <- function(directory, id = 1:332, sort = FALSE, asc = TRUE) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
  result<-data.frame(id=NA, nobs=0)
  fileList<-paste(directory, "/", sprintf("%03d", id), ".csv", sep="")
  dataList <- lapply(fileList, read.csv)
  for(i in 1:length(dataList)){
    fullDataSets <- subset(dataList[[i]], !is.na(sulfate) & !is.na(nitrate)) 
    if(nrow(fullDataSets) > 0) {
      result[i,] <- c(id[i], nrow(fullDataSets) )
    } else {
      result[i,] <- c(id[i],0)
    }
  } ## Would like to find a better way to set this
  dir<-1
  if(!asc){
    dir<- -1
  }
    
  if(sort){
    result[with(result, order(dir * nobs)),]
  }
  else {
    result
  }

}