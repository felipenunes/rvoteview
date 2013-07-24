voteview.download <-
function(ids) {
  theurl <- sprintf("http://leela.sscnet.ucla.edu/voteview/download?ids=%s&xls=F",
                     paste(ids,collapse=","))
  conn <- url(theurl)
  suppressWarnings(resjson <- readLines(conn))
  close(conn)
  return(resjson)
}
