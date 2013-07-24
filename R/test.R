test <-
function() {
  res <- voteview.search("abortion")
  json <- voteview.download(res$id)
#  return( read.voteview.json(json) )
  return( voteview2rollcall(json) )
}
