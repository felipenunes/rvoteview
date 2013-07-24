\name{voteview2rollcall}
\alias{voteview2rollcall}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Transform Data of Vote View to Roll Call Votes
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
voteview2rollcall(json)
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
    data <- read.voteview.json(json)
    dat <- data$votematrix[, grep("^V\\d+", names(data$votematrix))]
    rnames <- sprintf("\%s \%s - \%s", trim(data$votematrix$name), 
        data$votematrix$cqlabel, data$votematrix$icpsr)
    rownames(dat) <- rnames
    legis.data <- data$votematrix[, -grep("^V\\d+", names(data$votematrix))]
    rownames(legis.data) <- rnames
    rc <- rollcall(data = dat, yea = c(1, 2, 3), nay = c(4, 5, 
        6), missing = c(NA, 7, 8, 9), notInLegis = 0, legis.data = legis.data, 
        vote.data = data$rollcalls, source = "Download from VoteView")
    return(rc)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
