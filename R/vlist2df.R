vlist2df <-
function(rcs) {
  df <- list()
  flds <- names(rcs[[1]])
  for (f in flds) {
    md <- ifelse(class(rcs[[1]][[f]])=="character","character","integer")
    df[[f]] <- vector(mode=md,length=length(rcs))
  }
  for (i in 1:length(rcs)) {
     for (f in flds) {
       df[[f]][i] <- rcs[[i]][[f]]
     }
  }
  return( as.data.frame(df,stringsAsFactors=FALSE) )
}
