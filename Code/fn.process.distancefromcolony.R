## ########################################################################################
#' Calculate distance from tracked colonies to untracked colonies
#'
#' @description 
#'  
#' @param costgrid The projection that the data are currently in. 
#' Will accept any input that follows `crs()` convention, eg. "espg:25831" or "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84".
#' @param fromCoords1 A vector of (projected) longitude coordinates of colonies to calculate distances from 
#' @param fromCoords2 A vector of (projected) latitude coordinates of colonies to calculate distances from 
#' @param toCoords1 A vector of (projected) longitude coordinates of colonies to calculate distances to 
#' @param toCoords2 A vector of (projected) latitude coordinates of colonies to calculate distances to 
#' @param fromNames Characters of length(fromCoords1) giving the names of the colonies that distances are being calculated from. Default is NULL
#' @param toNames Characters of length(toCoords1) giving the names of the colonies that distances are being calculated to. Default is NULL

#' @return a matrix/array with the same number of rows as toCoords1 and cols as fromCoords1 
#' 
#' @examples 
#' 
#'  
#' @export



dist.to.colony <- function(costgrid, fromCoords1, fromCoords2, toCoords1, toCoords2, fromNames=NULL, toNames=NULL){
  
  result <- tryCatch({
    
    colonydat <- as.matrix(cbind(fromCoords1, fromCoords2))
    spatdat <- as.matrix(cbind(toCoords1, toCoords2))
    
    
    f <- gdistance::costDistance(x = costgrid, fromCoords = colonydat, toCoords = spatdat) 
    
    if(!is.null(fromNames)){colnames(f) <- fromNames}
    
    if(!is.null(toNames)){rownames(f) <- toNames}
    
    f <- f
    
  }, warning = function(w) {w$message <- paste0("projection transform warning: ",w$message, " (dist.to.colony)")
  }, error = function(e) {e$message <- paste0("projection transform error: ",e$message, " (dist.to.colony)")})

  
   
  return(result)
}