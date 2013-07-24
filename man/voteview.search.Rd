\name{voteview.search}
\alias{voteview.search}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Search for Queries inside VoteView Data
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
voteview.search(query, startdate = NULL, enddate = NULL, chamber = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{query}{
%%     ~~Describe \code{query} here~~
}
  \item{startdate}{
%%     ~~Describe \code{startdate} here~~
}
  \item{enddate}{
%%     ~~Describe \code{enddate} here~~
}
  \item{chamber}{
%%     ~~Describe \code{chamber} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (query, startdate = NULL, enddate = NULL, chamber = NULL) 
{
    theurl <- sprintf("http://leela.sscnet.ucla.edu/voteview/search?q=\%s", 
        URLencode(query))
    if (!(is.null(startdate))) {
        theurl <- sprintf("\%s&startdate=\%s", theurl, startdate)
    }
    if (!(is.null(enddate))) {
        theurl <- sprintf("\%s&enddate=\%s", theurl, enddate)
    }
    if (!(is.null(chamber))) {
        theurl <- sprintf("\%s&chamber=\%s", theurl, chamber)
    }
    conn <- url(theurl)
    suppressWarnings(resjson <- fromJSON(readLines(conn)))
    cat(sprintf("Query '\%s' returned \%i votes...\n", query, resjson$recordcount))
    close(conn)
    return(vlist2df(resjson$rollcalls))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
