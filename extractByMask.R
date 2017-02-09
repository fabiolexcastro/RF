library(raster)
library(rgdal)

path    <- "D:/_gisse2h_2030/2020_2049"
mask    <- raster("D:/CC/_bd/_eastAfrica/_raster/_base/studyarea_30s")

files   <- list.files(path, full.names = TRUE)
toMatch <- c("bio", "prec", "tm")
matches <- unique(grep(paste(toMatch,collapse="|"), files, value=TRUE))
st      <- stack(matches)

cut     <- crop(st, mask)
cut     <- mask(cut, mask)
layers  <- unstack(cut)

for(i in 1:length(layers)){
  
  writeRaster(layers[[i]], paste0("D:/CC/_bd/_eastAfrica/_raster/example.asc")  
  
}
