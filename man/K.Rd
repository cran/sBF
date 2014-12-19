\name{K}
\Rdversion{1.1}
\alias{K}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Kernel weighting function
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Instrumental to the \code{sBF} function. It returns weights used in the Nadaraya-Watson estimator.
}
\usage{
K(u, method = "gaussian")
}
\arguments{
  \item{u}{
%%     ~~Describe \code{u} here~~
distance from the origin.
}
  \item{method}{
%%     ~~Describe \code{method} here~~
type of kernel function. The default value is \code{gaussian}, other possible methods are: \code{unifrom}, \code{epanechnikov}, \code{biweight}, and \code{triweight}.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The domain of the kernel functions is centered at the origin and generally the weight value returned by the kernel decreases while the distance \code{u} from the origin increases.
}
\references{
%% ~put references to the literature/web site here ~
Silverman, B. W. (1986) \emph{Density Estimation}. London: Chapman and Hall. 
}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[sBF]{sBF-package}}, \code{\link[sBF]{sBF}}.
}
