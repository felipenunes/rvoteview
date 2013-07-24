read.voteview.json <-
function(json) { 
  suppressWarnings(data <- fromJSON(json)) # readLines gives missing end of line warning
  data$votematrix <- as.data.frame(data$votematrix,stringsAsFactors=F)[,data$vmNames]
  data$rollcalls <- as.data.frame(data$rollcalls,stringsAsFactors=F)[,data$rcNames]
  data$vmNames <- NULL
  data$rcNames <- NULL
  return( data )
}
