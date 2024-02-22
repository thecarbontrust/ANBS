## ########################################################################################
#' Generic function to load RDS files
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the data holding the dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset 
#' 
#' @return object
#'  
#' @export

read_rds <- function(dspathn, verpathn, dname){
  
  result <- tryCatch({
    
    
    f <- terra::readRDS(paste0(dspathn, "/",verpathn, "/",dname,".rds"))
    
    
  }, warning = function(w) {w$message <- paste0("warning: ",w$message, " (read_rds)")
  }, error = function(e) {e$message <- paste0("error: ",e$message, " (read_rds)")})
  
  return(result)
}