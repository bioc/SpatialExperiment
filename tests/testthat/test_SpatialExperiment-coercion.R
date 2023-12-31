dir <- system.file(
    file.path("extdata", "10xVisium", "section1", "outs"),
    package = "SpatialExperiment")
fnm <- file.path(dir, "spatial", "tissue_positions_list.csv")
xyz <- read.csv(fnm, header = FALSE, col.names = c(
    "barcode", "in_tissue", "array_row", "array_col",
    "pxl_row_in_fullres", "pxl_col_in_fullres"))
img <- readImgData(
    path = file.path(dir, "spatial"),
    sample_id="sample01")
example(SingleCellExperiment, echo=FALSE)
sce <- sce[1:50, 1:50]

.spe <- "SpatialExperiment"

test_that("SingleCellExperiment AS SpatialExperiment case 1", {
    expect_s4_class(as(sce, .spe), class=.spe)
})

test_that("SingleCellExperiment AS SpatialExperiment case 2", {
    int_colData(sce)$spatialData <- DataFrame(xyz[,c(1:4)])
    int_colData(sce)$spatialCoords <- as.matrix(xyz[,c(5,6)])
    expect_s4_class(as(sce, .spe), class=.spe)
})

test_that("SingleCellExperiment AS SpatialExperiment case 3", {
    int_colData(sce)$spatialData <- DataFrame(xyz[,c(1:4)])
    int_colData(sce)$spatialCoords <- as.matrix(xyz[,c(5,6)])
    int_colData(sce)$imgData <- img
    expect_s4_class(as(sce, .spe), class=.spe)
})

test_that("SingleCellExperiment TO SpatialExperiment case 1" ,{
    # case 1: no arguments
    expect_s4_class(toSpatialExperiment(sce), .spe)
    expect_equal(toSpatialExperiment(sce), as(sce, .spe))
})


test_that("SingleCellExperiment TO SpatialExperiment case 2" ,{
    # case 2: passing "spatial arguments" on simple sce
    expect_s4_class(toSpatialExperiment(sce, imgData=img,
        spatialData=DataFrame(xyz),
        spatialCoordsNames=c("pxl_col_in_fullres", "pxl_row_in_fullres"),
        sample_id="sample01"), .spe)
})

test_that("SingleCellExperiment TO SpatialExperiment case 3" ,{
    # case 3: passing "spatial arguments" on populated sce
    # giving priority to "spatial args"
    
    int_colData(sce)$spatialData <- DataFrame(xyz[, c(1:4)])
    int_colData(sce)$spatialCoords <- as.matrix(xyz[, c(5,6)])
    xyz$in_tissue <- 1
    xyz$pxl_row_in_fullres <- 1
    spe <- toSpatialExperiment(sce, imgData=img,
       spatialData=DataFrame(xyz),
       spatialCoordsNames=c("pxl_col_in_fullres", "pxl_row_in_fullres"),
       sample_id="sample01")
    expect_s4_class(spe, .spe)
    expect_equal(spatialCoords(spe), as.matrix(xyz[, c(6,5)]))
    expect_equal(spatialData(spe), DataFrame(xyz[, c(1:4)]))
})
