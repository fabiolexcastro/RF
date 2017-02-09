library(raster)
library(rgdal)

path    <- " "
mask    <- raster(" /studyarea_30s")

files   <- list.files(path, full.names = TRUE)
toMatch <- c("bio", "prec", "tm")
matches <- unique(grep(paste(toMatch,collapse="|"), files, value=TRUE))
st      <- stack(matches)

cut     <- crop(st, mask)
cut     <- mask(cut, mask)
layers  <- unstack(cut)

for(i in 1:length(layers)){
  
  writeRaster(layers[[i]], paste0(" /", names(layers[[i]]), ".asc"))    
  
}

