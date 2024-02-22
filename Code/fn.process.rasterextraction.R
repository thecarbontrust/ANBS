## ########################################################################################
#' Extracting the UD distributions (RasterStacks) in the specified footprint (SpatialPolygons)
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param rasterx Full path to the data holding the dataset.
#' @param spatialx Folder name for the required version
#' 
#' @return a list containing a matrix with nrow=number of cells selected by intersection, ncol=number of layers in a raster or RasterLayer. 
#' The rownames are the cellnumbers from the selected cells
#'  
#' @export


process_rasterextraction <- function(rasterx, spatialx){
  
    
  result <- tryCatch({
    
  #  vraster <- velox(rasterx)
  #  list.vx <- velox(rasterx)$extract(spatialx) # Extract cells that intersect spatial object
  #  matrix.vx = do.call(rbind, list.vx) # rowbind all matrices 
    
    # Extract the cells and values from all layers in the RasterStack, which touch or are included in the specified polygon
    matrix.ext <- extract(rasterx, fp.shp, cellnumbers=TRUE, weights=TRUE, normalizeWeights=FALSE)
    rownames(matrix.ext[[1]]) <- matrix.ext[[1]][,1] # Assign cell numbers as rownames in the matrix
    matrix.ext[[1]] <- matrix.ext[[1]][,colnames(matrix.ext[[1]])!="cell"] # Delete cell numbers, which are the first column in the matrix
    
    # Reweight all of the cells  by the proportion
    matrix.ext[[1]] <- matrix.ext[[1]][,1:100] * matrix.ext[[1]][,colnames(matrix.ext[[1]])=="weight"] 

  }, warning = function(w) {w$message <- paste0("warning: ",w$message, " (process_rasterextraction)")
  }, error = function(e) {e$message <- paste0("error: ",e$message, " (process_rasterextraction)")})
  
  return(result)
}

