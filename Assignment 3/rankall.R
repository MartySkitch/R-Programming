## Rank hospitals by outcome in all state

rankall <- function(outcome, num = "best") {
  ## Read the outcome date
  outcome.data<-read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  valid.states<-unique(outcome.data[,"State"])
  
  ##outcome.data.state <- subset(outcome.data, State==toupper(state) )
  
  if( tolower(outcome) == "heart attack" )
  {
    Hospital.30.Day <- 11 ##"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  }
  else if( tolower(outcome) == "heart failure" )
  {  
    Hospital.30.Day <- 17 ##"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  else if( tolower(outcome) == "pneumonia" )
  {
    Hospital.30.Day <- 23 ##"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
  }
  else
  {
    stop("invalid outcome")
  }
  ## REturn hospital in the state with the lowest 30-day death rate and filter data return 3 columns
  outcome.data.all <- subset(outcome.data, outcome.data[,Hospital.30.Day] != "Not Available", select = c(2, 7, Hospital.30.Day))
  ## convert # of deaths to numeric
  outcome.data.all[,3]<-sapply(outcome.data.all[,3], as.numeric)
  ## split by state
  state <- split(outcome.data.all, outcome.data.all$State)
  ## now sort each state
  state.sorted <- lapply(state, function(x){ x[order(x[,3], x[,1]),] } )
  ## Lets get the hospital ranking 
  if (num == "best")
  {
    num = 1
  }
  state.results <- lapply(state.sorted, 
      function(x)
      { 
        if(num == "worst")
          {
            x[nrow(x),]
          }
        else
          {
            x[num,]
          }
      }
  )
  
  result <- do.call("rbind", state.results)
  names(result)[1] <- "state"
  names(result)[2] <- "hospital"  
  result[4] = NULL
  result[3] = NULL

  result
  
}

