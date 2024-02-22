## ########################################################################################
#' Create raster stacks for untracked colonies, by selecting simulations from tracked colonies. 
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param species Species name, e.g. "Guillemot"
#' @param untrackedcolony Vector of colony names or codes
#' @param trackedcolony Vector of tracked colonies 
#' @param iteration Vector of corresponding iterations (which refer to the rasterstack layers 
#' of the tracked colonies). trackedcolony and iteration much be the same length

#' 
#' @return RasterStack
#'  
#' @export
#' 

fn.process.makerasterstack <- function(species, untrackedcolony, trackedcolony, iteration){
  
  for(j in 1:length(trackedcolony)){
    
    if(j==1){
      
      x <- raster::stack(get(paste0("ud.",species, trackedcolony[j]))[[iteration[j]]], full.names=T, quick=TRUE)
      
      
    } else { 
      
      x[[j]] <- get(paste0("ud.",species, trackedcolony[j]))[[iteration[j]]]
      
      
    }
  }
  
  assign(paste0("ud.",species, untrackedcolony), x, envir=.GlobalEnv)
  
  print(paste0("ud.",species, untrackedcolony, " Raster stack created"))
  return()
}
