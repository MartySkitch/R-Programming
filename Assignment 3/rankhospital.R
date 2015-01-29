## Rank hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
  ## Read the outcome date
  outcome.data<-read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  valid.states<-unique(outcome.data[,"State"])
  
  if( !(toupper(state) %in% valid.states ) )
  {
    stop("invalid state")
  }
  
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
  ## REturn hospital in the state with the lowest 30-day death rate
  
  outcome.data.state <- subset(outcome.data, State==toupper(state) & outcome.data[,Hospital.30.Day] != "Not Available", select = c(2, Hospital.30.Day))
  hospital.ranking <- rank.Hospital(outcome.data.state)
  if(!is.numeric(num))
  {
      if(num == "best")
      {
        num = 1
      }
      else 
      {
        num = nrow(hospital.ranking)  
      }
  }

  hospital.ranking[num, 1]
}

rank.Hospital <- function(state.data) {
  
  state.data[,2]<-sapply(state.data[,2], as.numeric)
  state.data.sorted<-state.data[order(state.data[,2], state.data[,1]), ]
  state.data.sorted$Rank <- c(1:nrow(state.data.sorted))  ## add Rank column and data
  state.data.sorted  ## the last statement is the return
}