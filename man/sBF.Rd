\name{sBF}
\Rdversion{1.1}
\alias{sBF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Smooth Backfitting Estimator
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Smooth Backfitting for additive models using Nadaraya-Watson estimator.
}
\usage{
sBF(dat, depCol = 1, m = 100, windows = rep(20, ncol(dat) - 1),
bw = NULL, method = "gaussian", mx = 100, epsilon = 1e-04,
PP = NULL, G = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{dat} here~~
matrix of data.
}
  \item{depCol}{
%%     ~~Describe \code{depCol} here~~
column of \code{dat} matrix in which the dependent variable is positioned.
}
  \item{m}{
%%     ~~Describe \code{m} here~~
number of grid points. Higher values of \code{m} imply better estimates and loger computational time.
}
  \item{windows}{
%%     ~~Describe \code{windows} here~~
number of windows. (covariate range width)/\code{windows} provide the bandwidths for the kernel regression smoother.
}
  \item{bw}{
%%     ~~Describe \code{bw} here~~
bandwidths for the kernel regression smoother.
}
  \item{method}{
%%     ~~Describe \code{method} here~~
kernel method. See function \code{\link[sBF]{K}}.
}
  \item{mx}{
%%     ~~Describe \code{mx} here~~
maximum iterations number.
}
  \item{epsilon}{
%%     ~~Describe \code{epsilon} here~~
convergence limit of the iterative algorithm.
}
  \item{PP}{
%%     ~~Describe \code{PP} here~~
matrix of joint probabilities.
}
  \item{G}{
%%     ~~Describe \code{G} here~~
grid on which univariate functions are estimated.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
Bandwidth can be chosen in two different ways: through the argument \code{bw} or defining the number of \code{windows} into the range of the values of any independent variable through the argument windows (equal to 20 by default). Bandwidth is the width of the windows. Both the parameters \code{bw} and \code{windows} can be single values, then every smoother has the same bandwidth, or they can be vectors of length equal tu the covariates number to specify different bandwidths for any direction. Higher values of the bandwidth provide smoother estimates.

In applications it could be useful using the same \code{PP} matrix for different estimates, e.g. to evaluate the impact of different bandwidths and develop algorithms to select optimal bandwidths (see, for example \emph{Nielsen and Sperlich, 2005, page 52}). This reasoning applies also to the grid \code{G}. This is why the possibility to input matrices \code{G} and \code{PP} as parameters is given. The program creates \code{G} and \code{PP} if they are not inserted.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{mxhat}{estimated univariate functions on the \code{grid} points.} 
\item{m0}{estimated constant value in the additive model.}
\item{grid}{the grid.}
\item{conv}{boolean variable indicating whether the convergence has been achieved.}
\item{nit}{number of iterations performed.}
\item{PP}{matrix of joint probabilities.}
\item{bw}{bandwidths used for the kernel regression smoother.}
}
%\references{
%% ~put references to the literature/web site here ~
%}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link[sBF]{sBF-package}}, \code{\link[sBF]{K}}.
}
\examples{
X <- matrix(rnorm(1000), ncol=2)
MX1 <- X[,1]^3
MX2 <- sin(X[,2])
Y <- MX1 + MX2
data <- cbind(Y, X)
  
est <- sBF(data)

par(mfrow=c(1, 2))
plot(est$grid[,1],est$mxhat[,1], type="l",
     ylab=expression(m[1](x[1])), xlab=expression(x[1]))
curve(x^3, add=TRUE, col="red")
plot(est$grid[,2],est$mxhat[,2], type="l",
     ylab=expression(m[2](x[2])), xlab=expression(x[2]))
curve(sin(x), add=TRUE, col="red")
par(mfrow=c(1, 1))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
