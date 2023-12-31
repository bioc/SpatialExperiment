% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SpatialExperiment-methods.R, R/imgData.R
\name{SpatialExperiment-methods}
\alias{SpatialExperiment-methods}
\alias{spatialData}
\alias{spatialData<-}
\alias{spatialDataNames}
\alias{spatialDataNames<-}
\alias{spatialCoords}
\alias{spatialCoords<-}
\alias{spatialCoordsNames}
\alias{spatialCoordsNames<-}
\alias{imgData}
\alias{imgData<-}
\alias{scaleFactors}
\alias{spatialData,SpatialExperiment-method}
\alias{spatialData<-,SpatialExperiment,DFrame-method}
\alias{spatialData<-,SpatialExperiment,NULL-method}
\alias{spatialDataNames,SpatialExperiment-method}
\alias{spatialDataNames<-,SpatialExperiment,character-method}
\alias{spatialDataNames<-,SpatialExperiment,NULL-method}
\alias{spatialCoords,SpatialExperiment-method}
\alias{spatialCoords<-,SpatialExperiment,matrix-method}
\alias{spatialCoords<-,SpatialExperiment,NULL-method}
\alias{spatialCoordsNames,SpatialExperiment-method}
\alias{spatialCoordsNames<-,SpatialExperiment,character-method}
\alias{spatialCoordsNames<-,SpatialExperiment,NULL-method}
\alias{scaleFactors,SpatialExperiment-method}
\alias{$,SpatialExperiment-method}
\alias{imgData,SpatialExperiment-method}
\alias{imgData<-,SpatialExperiment,DataFrame-method}
\alias{imgData<-,SpatialExperiment,NULL-method}
\title{Methods for spatial attributes}
\usage{
\S4method{spatialData}{SpatialExperiment}(x)

\S4method{spatialData}{SpatialExperiment,DFrame}(x) <- value

\S4method{spatialData}{SpatialExperiment,`NULL`}(x) <- value

\S4method{spatialDataNames}{SpatialExperiment}(x)

\S4method{spatialDataNames}{SpatialExperiment,character}(x) <- value

\S4method{spatialDataNames}{SpatialExperiment,`NULL`}(x) <- value

\S4method{spatialCoords}{SpatialExperiment}(x)

\S4method{spatialCoords}{SpatialExperiment,matrix}(x) <- value

\S4method{spatialCoords}{SpatialExperiment,`NULL`}(x) <- value

\S4method{spatialCoordsNames}{SpatialExperiment}(x)

\S4method{spatialCoordsNames}{SpatialExperiment,character}(x) <- value

\S4method{spatialCoordsNames}{SpatialExperiment,`NULL`}(x) <- value

\S4method{scaleFactors}{SpatialExperiment}(x, sample_id = TRUE, image_id = TRUE)

\S4method{$}{SpatialExperiment}(x, name)

\S4method{imgData}{SpatialExperiment}(x)

\S4method{imgData}{SpatialExperiment,DataFrame}(x) <- value

\S4method{imgData}{SpatialExperiment,`NULL`}(x) <- value
}
\arguments{
\item{x}{A \code{\link{SpatialExperiment}} object.}

\item{value}{Replacement value for replacement methods.}

\item{sample_id}{Logical value or character vector specifying sample
identifier(s) for \code{scaleFactors}. Default = \code{TRUE} (all samples).}

\item{image_id}{Logical value or character vector specifying image
identifier(s) for \code{scaleFactors}. Default = \code{TRUE} (all images).}

\item{name}{The name of the \code{colData} column to extract.}
}
\value{
Return value varies depending on method, as described below.
}
\description{
The \code{\link{SpatialExperiment}} class provides a family of methods to get
and set spatial data attributes in \code{\link{SpatialExperiment}} objects.
Spatial attributes include \code{spatialCoords}, \code{imgData}, and
\code{scaleFactors}, as well as methods to rotate and mirror
SpatialExperiment objects and their spatial coordinates.
}
\details{
Additional details for each type of data attribute are provided below.

Note: \code{\link{spatialData}} and \code{\link{spatialDataNames}}
(previously used to store a subset of columns from \code{\link{colData}})
have been deprecated. All columns should be stored in either
\code{\link{spatialCoords}} (numeric matrix containing spatial coordinates)
or \code{\link{colData}} (all other columns). The
\code{spatialData}/\code{spatialDataNames} functionality has been retained
for backward compatibility but may be removed in the future.

See \code{\link{rotateCoords}}, \code{\link{mirrorCoords}},
\code{\link{rotateObject}}, or \code{\link{mirrorObject}} for details on
methods to rotate and mirror SpatialExperiment objects and their
\code{spatialCoords}.
}
\section{spatialData and spatialCoords methods}{

\describe{
\item{\code{spatialData(x) <- value}: }{
  The \code{spatialData} setter expects a \code{DataFrame}. 
  If the input does not contain an \code{in_tissue} column, 
  this will be included with a default value of \code{1}.}
\item{\code{spatialCoords(x)}: }{
  Getter for numeric matrix of spatial coordinates.}
\item{\code{spatialCoords(x) <- value}: }{
  Setter for numeric matrix of spatial coordinates.}
}
}

\section{spatialDataNames and spatialCoordsNames methods}{

\describe{
\item{\code{spatialDataNames(x)}: }{
  Returns the names of the \code{colData} associated with the 
  spatial information, which are stored in the \code{int_metadata}.}
\item{\code{spatialDataNames(x) <- value}: }{
  Setter to replace column names
  in the \code{spatialData} \code{DataFrame}.}
\item{\code{spatialCoordsNames(x)}: }{
  Returns the defined names of the
  spatial coordinates (e.g. \code{c("x", "y")}).}
\item{\code{spatialCoordsNames(x) <- value}: }{
  Setter to define the names of the spatial coordinate columns.}
}
}

\section{imgData methods}{

\describe{
\item{\code{imgData(x)}: }{
  Getter to return the \code{imgData} \code{DataFrame}.}
\item{\code{imgData(x) <- value}: }{
  Setter to provide a \code{DataFrame} object as 
  \code{imgData} of the \code{SpatialExperiment} object.}
}
}

\section{Other methods}{

\describe{
\item{\code{scaleFactors(x, sample_id, image_id)}: }{
  Getter to return the scale factors associated with the 
  \code{sample_id}(s) and \code{image_id}(s) provided. 
  This is related to the stored image(s) in the \code{SpatialExperiment} 
  \code{imgData} structure. See argument descriptions for further details.}
}
}

\examples{
example(read10xVisium)

# spatialCoords returns a numeric matrix
head(spatialCoords(spe))

# change spatial coordinate names
spatialCoordsNames(spe)
spatialCoordsNames(spe) <- c("x", "y")
head(spatialCoords(spe))

# imgData and scale factors
imgData(spe)
scaleFactors(spe)

# tabulate number of spots mapped to tissue
cd <- colData(spe)
table(
  in_tissue = cd$in_tissue, 
  sample_id = cd$sample_id)
}
