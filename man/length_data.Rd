\name{length_data}
\alias{length_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
downloading protein length
}
\description{
Download the length of the protein, including the starting and ending positions
}
\usage{
length_data()
}
%- maybe also 'usage' for other objects documented here.
\details{
Download the length of the protein, including the starting and ending positions
}
\value{

The length of the protein
}
\references{
https://cran.r-project.org/doc/manuals/R-exts.html
}
\author{
Xiaoyu Zhang
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
code{\link{help}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    library(XML)
    library(plyr)
    protein = read.table("Protein.txt", sep = "\t", stringsAsFactors = F)
    name = protein[2]
    url_p = "http://www.uniprot.org/uniprot/"
    url_s = "#showFeatures"
    url_w = paste(url_p, name, url_s, sep = "")
    url = url_w
    doc <- htmlParse(url)
    position_l = xpathSApply (doc, "//table[@id= 'peptides_section'] 
  /tr/td/  a[@class = 'position tooltipped']",  
        xmlValue)
    s_l <- c()
    for (i in 1:length(position_l)) {
        s_l[i] <- gsub(pattern = "//D", replacement = "x", position_l[i])
    }
    s_l <- strsplit(s_l, "xxx")
    d2_l <- laply(s_l, function(x) x[2])
    r1_l <- 0
    r2_l <- d2_l
    dfrm_l <- data.frame(r1_l, r2_l)
    write.table(dfrm_l, file = "Length.txt", sep = "/t", quote = FALSE, 
        row.names = F, col.names = F)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ length data}
\keyword{ file }
