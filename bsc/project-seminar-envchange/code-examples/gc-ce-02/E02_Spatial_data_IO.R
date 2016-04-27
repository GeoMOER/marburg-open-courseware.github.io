#' ---
#' title:
#' author: Tim Appelhans & Hanna Meyer
#' ---

#+ setup, include=FALSE
knitr::opts_knit$set(
  root.dir = '/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change')

#'
#' ### vector data - shapefiles
#' #### reading vector data into R
#' Using package **rgdal** we can use the gdal drivers to read ESRI shapefiles.
#' As shapefiles have layers, we need to know which layer to load

library(rgdal)
library(mapview)

#' first we set our working directory
#+ wd, eval = FALSE

setwd('/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change')

#' then we can start working

shp_file <- "data/gadm_deu/gadm_deu.shp"

lyr <- ogrListLayers(dsn = shp_file)
lyr

gadm_deu <- readOGR(dsn = shp_file,
                    layer = lyr)

plot(gadm_deu)
mapview(gadm_deu, color = "blue")

#' #### writing vector data to disk
#' the same drivers also handle writing of shapefiles

writeOGR(obj = gadm_deu,
         dsn = "data/gadm_deu/my_shape.shp",
         layer = "my_shape",
         driver = "ESRI Shapefile",
         overwrite_layer = TRUE)

#' the `driver` argument can be used to write many different file formats

ogrDrivers()

#' ### raster data - geotifs
#' #### reading single raster data into R
#' With package **raster** it is easy to read valid raster formats such as GeoTiff.
#' We simply need to pass the path to the file to the `raster()` function
library(raster)

tmean01 <- raster("data/tmean_deu/tmean_deu_m01.tif")
tmean01

#plot(tmean01)
mapview(tmean01)


#' #### writing single raster data to disk
#' For writing raster data we use function `writeRaster()`

writeRaster(tmean01,
            filename = "data/tmean_deu/my_raster_layer.tif",
            overwrite = TRUE)

#' for raster data we also have multiple file type options

writeFormats()

#' #### reading multiple raster data into R
#' If we want to read more than one raster file at a time,
#' we can use R to `list.files()` in a folder containing a certain string
#' and then pass this to `stack()`

fls <- list.files(path = "data/tmean_deu",
                  pattern = glob2rx("tmean_deu_*.tif"),
                  full.names = TRUE)

fls

tmean_deu <- stack(x = fls)
tmean_deu

#' #### writing multiple raster data to disk
#' this is also done using `writeRaster()`

writeRaster(x = tmean_deu,
            filename = "data/tmean_deu/my_raster.tif",
            bylayer = TRUE,
            suffix = "names",
            overwrite = TRUE)

#' **NOTE:** `bylayer` and `suffix` are only needed if we want to write a `RasterStack`.
