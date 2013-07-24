\name{read.voteview.json}
\alias{read.voteview.json}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read Roll Call Votes from VoteView Database
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.voteview.json(json)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{json}{
%%     ~~Describe \code{json} here~~
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
function (json) 
{
    suppressWarnings(data <- fromJSON(json))
    data$votematrix <- as.data.frame(data$votematrix, stringsAsFactors = F)[, 
        data$vmNames]
    data$rollcalls <- as.data.frame(data$rollcalls, stringsAsFactors = F)[, 
        data$rcNames]
    data$vmNames <- NULL
    data$rcNames <- NULL
    return(data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
