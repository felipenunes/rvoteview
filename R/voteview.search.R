voteview.search <-
function(query,startdate=NULL,enddate=NULL,chamber=NULL) {
   theurl <- sprintf("http://leela.sscnet.ucla.edu/voteview/search?q=%s",
                     URLencode(query))
   if (!(is.null(startdate))) {
     theurl <- sprintf("%s&startdate=%s",theurl,startdate)
   }
   if (!(is.null(enddate))) {
     theurl <- sprintf("%s&enddate=%s",theurl,enddate)
   }
   if (!(is.null(chamber))) {
     theurl <- sprintf("%s&chamber=%s",theurl,chamber)
   }   
   conn <- url(theurl)
   suppressWarnings(resjson <- fromJSON(readLines(conn)))
   cat(sprintf("Query '%s' returned %i votes...\n",query,resjson$recordcount))
   close(conn)
   return( vlist2df(resjson$rollcalls) )
}
