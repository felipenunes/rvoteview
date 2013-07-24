voteview2rollcall <-
function(json) {
  data <- read.voteview.json(json)
  dat  <- data$votematrix[,grep("^V\\d+",names(data$votematrix))]
  rnames <- sprintf("%s %s - %s",trim(data$votematrix$name),
                                 data$votematrix$cqlabel,
                                 data$votematrix$icpsr)
  rownames(dat) <- rnames
  legis.data <- data$votematrix[,-grep("^V\\d+",names(data$votematrix))]
  rownames(legis.data) <- rnames
  rc <- rollcall(data=dat,
                 yea=c(1,2,3),
                 nay=c(4,5,6),
                 missing=c(NA,7,8,9),
                 notInLegis=0,
                 legis.data=legis.data,
                 vote.data=data$rollcalls,
                 source="Download from VoteView")
  return(rc)
}
