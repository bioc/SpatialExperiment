% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readImgData.R
\name{readImgData}
\alias{readImgData}
\title{Read images & scale factors for 10x Genomics Visium}
\usage{
readImgData(
  path = ".",
  sample_id = names(path),
  imageSources = file.path(path, "tissue_lowres_image.png"),
  scaleFactors = file.path(path, "scalefactors_json.json"),
  load = TRUE
)
}
\arguments{
\item{path}{a path where to find one or more images}

\item{sample_id}{the \code{sample_id} for the \code{\link{SpatialExperiment}}
object}

\item{imageSources}{the images source path(s)}

\item{scaleFactors}{the .json file where to find the scale factors}

\item{load}{logical; should the image(s) be loaded into memory
as a \code{grob}? If FALSE, will store the path/URL instead.}
}
\value{
a \code{\link{DataFrame}}
}
\description{
Function to read in images and scale factors for 10x Genomics Visium data,
and return as a valid \code{\link{imgData}} \code{DataFrame}.
}
\examples{
dir <- system.file(
  file.path("extdata", "10xVisium", "section1", "outs", "spatial"),
  package = "SpatialExperiment")

# base directory contains
# - scale factors (scalefactors_json.json)
# - one image (tissue_lowres_image.png)
list.files(dir)

# read in images & scale factors
# as valid 'imgData' 'DFrame'
readImgData(dir, sample_id = "foo")

}
\author{
Helena L. Crowell
}
