## ########################################################################################
#' Import GLS utilisation distributions and take the mean value in each grid cell over all months. 
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the data holding the dataset.
#' @param verpathn Folder name for the required version
#' @param species
#' @param months Months which are required to be read in, in numeric format
#' @param colony Names of colonies contained the GLS tracking data - can be a subset 
#' but specified names must match exactly those which are in the file names of the GLS UDs
#' being imported
#' 
#' @return RasterStack
#'  
#' @export
#' 

read_uds <- function(dspathn, verpathn, species, month, colony){
  
    
    # Internal loop to read all relevant filenames
    for (k in 1:100){
      
      # Cycle loop by months
      for (j in month){
        
        # If it's the first month in the series, create a blank object called 'files'
        if(j==month[1]){ files <- character()}
        
        
        # Create a temp object selecting the relevant month (j)
        temp <- Sys.glob(paste0(dspathn, "/",verpathn, "/", species, colony, j, "_iteration",k,".rds"))
        # Concatenate temp onto the files object
        files <- c(files,temp)
        print(paste0(species," ", colony, " ", "month=",j, "iteration=",k, " is loaded"))
      }
      
      # If there are no associated files, skip to the next iteration
      if(length(files)==0){next}
      
      
      # read all files into a list
      x <- lapply(files, readRDS) 
      
      
        # If only one month has been selected, the raster x=mean.x (no calculations are made)
        if(length(month)==1){
        mean.x <- raster(brick(x)) # quirk of converting x from a list to a raster is that it has to be done through brick()
        values(mean.x) <- values(brick(x)) # However, converting brick-->raster means that values are dropped so have to add them back on
        } else {
          
          
        # create a function by which to mosaic
        x$fun <- mean
          
        # Calculate the mean
        mean.x <- do.call(raster::mosaic, x)  
        }
      
      
      # Standardise the values of each raster layer to 1
      values(mean.x) <- values(mean.x) / sum(values(mean.x),na.rm=TRUE)
      
      # Rename the layer
      names(mean.x) <- paste0(species,colony, "_iteration",k)
      
      # create a SpatRaster (terra object)
      #ras.x <- rast(mean.x)
 

      # Create a raster stack
      if(k==1){
        # Create a raster stack
        ras.x <- raster::stack(mean.x, full.names=T, quick=TRUE)
        } else {
        ras.x[[k]] <- mean.x  
       # ras.x <- addLayer(ras.x, mean.x)
        }
    }

  
  return(ras.x)
}