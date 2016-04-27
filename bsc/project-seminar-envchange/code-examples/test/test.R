#' ---
#' title:
#' author: Tim Appelhans & Hanna Meyer
#'
#' output:
#'   html_document:
#'     highlight: tango
#'     self_contained: no
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

# gadm_deu <- readOGR(dsn = shp_file,
#                     layer = lyr)
gadm_deu <- getGeoData(name = "GADM", country = "DEU", level = 3)


mapview(gadm_deu, color = "blue")
