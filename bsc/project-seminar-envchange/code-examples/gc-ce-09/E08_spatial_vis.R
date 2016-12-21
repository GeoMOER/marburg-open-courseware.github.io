#' ---
#' title:
#' author: Tim Appelhans & Hanna Meyer
#' ---

#+ setup, include=FALSE
library(knitr)
opts_chunk$set(fig.height = 9, fig.width = 7)

#' ## load necessary packages
#+ packages, message=FALSE
library(tmap)
library(mapview)
library(raster)
library(rgdal)
library(viridisLite)
library(RColorBrewer)

#' ## set working directory
path <- "/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change/code"
setwd(path)

#' ## read and prepare data
lyr <- ogrListLayers("../data/gadm_deu/gadm_deu.shp")
gadm <- readOGR("../data/gadm_deu/gadm_deu.shp", layer = lyr)

fls <- list.files("../data/tmean_deu", pattern = glob2rx("*.tif"),
                  full.names = TRUE)
stck <- stack(fls)

tmean <- mean(stck)/10

tmean_gadm <- extract(tmean, gadm, fun = mean, sp = TRUE)

#' ## quick look with mapview
#+ mapview, include=TRUE, eval=FALSE
mapview(tmean_gadm, zcol = "layer", alpha.regions = 1, legend = TRUE)

#' ## quick plotting with spplot
spplot(tmean_gadm, zcol = "layer")

#' ## using tmap package to produce cartography-grade maps in R
tm_shape(tmean_gadm, unit = "deg", unit.size = 1) +
  tm_polygons()

tm_shape(tmean_gadm, unit = "deg", unit.size = 1) +
  tm_polygons(col = "layer")

pal <- colorRampPalette(rev(brewer.pal(9, "Spectral")))

pal


tm_shape(tmean_gadm, unit = "deg", unit.size = 1) +
  tm_polygons(col = "layer", palette = pal(6),
              auto.palette.mapping = FALSE)

tm_shape(tmean_gadm, unit = "deg", unit.size = 1) +
  tm_polygons(col = "layer", palette = inferno(9),
              auto.palette.mapping = FALSE,
              title = "Mean annual \ntemperature [°C]",
              border.col = "grey20", border.alpha = 0.3,
              breaks = seq(5, 11, 0.5)) +
  tm_legend(legend.frame = TRUE, legend.bg.color = "grey") +
  tm_style_grey(bg.color = "grey90", frame.lwd = 2) +
  tm_compass(position = c(.01, .055), color.light = "white", size = 1) +
  tm_scale_bar(position=c(0.03, 0.015)) +
  tm_layout(legend.title.size = 0.8)

#' change margins to avoid overlapping legend
tm_shape(tmean_gadm, unit = "deg", unit.size = 1) +
  tm_polygons(col = "layer", palette = inferno(9),
              auto.palette.mapping = FALSE,
              title = "Mean annual \ntemperature [°C]",
              border.col = "grey20", border.alpha = 0.3,
              breaks = seq(5, 11, 0.5)) +
  tm_legend(legend.frame = TRUE, legend.bg.color = "grey") +
  tm_style_classic(bg.color = "grey90", frame.lwd = 2) +
  tm_grid(projection = "longlat", labels.size = 0.5, lwd = .25,
          labels.inside.frame = TRUE) +
  tm_compass(position = c(.01, .055), color.light = "white", size = 3) +
  #tm_scale_bar(position=c(0.03, 0.015)) +
  tm_layout(legend.title.size = 0.8,
            inner.margins = c(0.02, 0.15, 0.02, 0.02)) +
  tm_xlab(text = "Longitude") +
  tm_ylab(text = "Latitude")

#' ### World example
#+ world1, fig.height = 5
data("World")
proj4string(World)
# png("/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change/code/hpi.png",
#     width = 30, height = 18, res = 300, units = "cm")
tm_shape(World, projection = "robin") +
  tm_polygons(col = "HPI",
              auto.palette.mapping = FALSE,
              palette = "RdYlGn",
              title = "Happy Planet Index") +
  tm_format_World(inner.margins = .02, frame = FALSE) +
  tm_style_natural(earth.boundary = c(-180, 180, -87, 87))  +
  tm_legend(position = c("left", "bottom"), bg.color = "grey95", frame = TRUE) +
  tm_credits(c("", "Robinson projection"), position = c("RIGHT", "BOTTOM")) +
  tm_grid(projection = "longlat", labels.size = .6, lwd = .25)
# dev.off()

#+ world2, fig.height = 6
tm_shape(World, projection = "robin") +
  tm_polygons(c("HPI", "gdp_cap_est"), auto.palette.mapping = c(FALSE, TRUE),
              palette = list("RdYlGn", "Purples"),
              style = c("pretty", "fixed"), n = 7,
              breaks = list(NULL, c(0, 500, 2000, 5000, 10000, 25000, 50000, Inf)),
              title = c("Happy Planet Index", "GDP per capita")) +
  tm_format_World(inner.margins = .02, frame = FALSE) +
  tm_style_classic(earth.boundary = c(-180, 180, -87, 87))  +
  tm_legend(position = c("left", "bottom"), bg.color = "grey95", frame = TRUE) +
  tm_credits(c("", "Robinson projection"), position = c("RIGHT", "BOTTOM"))


#' ### See [this](https://edzer.github.io/sp/) online tutorial for more possibilities to plot spatial data in R.
