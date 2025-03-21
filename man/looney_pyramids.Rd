% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/looney_pyramids.R
\name{looney_pyramids}
\alias{looney_pyramids}
\title{Configuration objects for drawing Looney Pyramids}
\usage{
looney_pyramids(..., border = TRUE)
}
\arguments{
\item{...}{Should be empty.}

\item{border}{If \code{TRUE} draw a black border line on piece edges.  Should normally be \code{TRUE} when
drawing with \code{{grid}} graphics and \code{FALSE} when drawing with 3D graphic systems.}
}
\value{
Returns a list with an \code{icehouse_pieces} configuration for drawing Looney Pyramids.
}
\description{
\code{looney_pyramids} provides a basic configuration object
for drawing Looney Pyramids.
}
\details{
Looney Pyramids aka Icehouse pieces is a game system invented by Andrew Looney.
See \url{https://www.looneylabs.com/looney-pyramids}.
}
