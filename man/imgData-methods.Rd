% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imgData-methods.R
\name{imgData-methods}
\alias{imgData-methods}
\alias{getImg}
\alias{addImg}
\alias{rmvImg}
\alias{getImg,SpatialExperiment-method}
\alias{addImg,SpatialExperiment-method}
\alias{rmvImg,SpatialExperiment-method}
\alias{imgRaster,SpatialExperiment-method}
\alias{imgSource,SpatialExperiment-method}
\alias{rotateImg,SpatialExperiment-method}
\alias{mirrorImg,SpatialExperiment-method}
\title{Methods for handling image-related data}
\usage{
\S4method{getImg}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL)

\S4method{addImg}{SpatialExperiment}(x, imageSource, scaleFactor, sample_id, image_id, load = TRUE)

\S4method{rmvImg}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL)

\S4method{imgSource}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL, path = FALSE)

\S4method{imgRaster}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL)

\S4method{rotateImg}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL, degrees = 90)

\S4method{mirrorImg}{SpatialExperiment}(x, sample_id = NULL, image_id = NULL, axis = c("h", "v"))
}
\arguments{
\item{x}{a \code{\link{SpatialExperiment}}}

\item{sample_id}{character string, \code{TRUE} or \code{NULL} specifying 
sample/image identifier(s); here, \code{TRUE} is equivalent to all 
samples/images and \code{NULL} specifies the first available entry (see details)}

\item{image_id}{see \code{sample_id}}

\item{imageSource}{a character string specifying an image file name 
(.png, .jpg or .tif) or URL to source the image from}

\item{scaleFactor}{single numeric scale factor used to rescale spatial 
coordinates according to the image's resolution}

\item{load}{logical; should the image(s) be 
loaded into memory as a \code{raster} object?
if \code{FALSE}, will store the path/URL instead}

\item{path}{logical; for \code{RemoteSpatialImage}s, TRUE 
returns the path to the image's cached file, and FALSE its URL. 
For \code{Stored/LoadedSpatialImage}s, a path/NA is returned, 
irrespective of \code{path}.}

\item{degrees}{single numeric 
in +/-[0,90,...,360] specifying how many degrees to rotate.
A negative/positive value corresponds to counter-/clockwise rotation}

\item{axis}{character string specifying whether to mirror 
horizontally (\code{"h"}) or vertically (\code{"v"})}
}
\value{
\code{getImg()} returns a single or list of \code{SpatialImage}(s).

\code{add/rmvImg()} return a \code{\link{SpatialExperiment}} 
with modified \code{imgData}; specifically, they create/remove 
an image entry (row) in the \code{imgData} \code{DataFrame}.

\code{imgRaster/Source()} access relevant data in the 
\code{SpatialImage}(s) stored inside the \code{imgData}'s \code{data} 
field. Depending on whether or not multiple entries are accessed,
a character string or vector is returned by \code{imgSource()}, and a 
single or list of \code{raster} object(s) is returned by \code{imgRaster()}.

\code{rotate/mirrorImg()} return a \code{Loaded\link{SpatialImage}}
with modified a \code{raster} matrix.
}
\description{
The set of functions described below is designed to handle 
the image-related data stored inside a \code{SpatialExperiment}'s 
\code{imgData} \code{int_metadata} field. These include:

\itemize{
\item \code{getImg}, \code{addImg}, \code{rmvImg}
  to retrieve/add/remove an image entry to/from 
  the \code{imgData} \code{DataFrame}
\item \code{imgSource}, \code{imgRaster}
  to retrieve the path/URL and \code{raster} object,
  respectively, associated with an image or set of images
}
}
\examples{
example(read10xVisium)

# 'SpatialImage' accession
(spi <- getImg(spe))
plot(imgRaster(spi))

# remove an image
imgData(spe)
spe <- rmvImg(spe,
  sample_id = "section1",
  image_id = "lowres")
imgData(spe)

# add an image
url <- "https://i.redd.it/3pw5uah7xo041.jpg"
spe <- addImg(spe,
  sample_id = "section1",
  image_id = "pomeranian",
  imageSource = url,
  scaleFactor = NA_real_,
  load = FALSE)

# extract image
img <- imgRaster(spe,
  sample_id = "section1",
  image_id = "pomeranian")
plot(img)

###################
# transformations #
###################

# clockwise rotation
spe1 <- rotateImg(spe, 
  degrees = 90) # first image
  
spe2 <- rotateImg(spe, 
  sample_id = TRUE,
  image_id = TRUE, 
  degrees = 90) # all images

par(mfrow = c(1, 3))
plot(imgRaster(spe))
plot(imgRaster(spe1))
plot(imgRaster(spe2))

# horizontal/vertical mirroring
spe1 <- mirrorImg(spe, axis = "h")
spe2 <- mirrorImg(spe, axis = "v")

par(mfrow = c(1, 3))
plot(imgRaster(spe))
plot(imgRaster(spe1))
plot(imgRaster(spe2))
  
}
\author{
Helena L. Crowell
}
