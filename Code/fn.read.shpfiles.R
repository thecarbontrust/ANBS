## ########################################################################################
#' Import .shp files
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the data holding the dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#'
#' @return 'sf' object, which contains sf and a dataframe (Region <chr>, geometry)
#'  
#' @export


read_shpfiles <- function(dspathn, verpathn, dname){
  
  
  result <- tryCatch({
    
    
    f <- sf::st_read(paste0(dspathn, "/",verpathn, "/",dname,".shp"))
    
    
  }, warning = function(w) {w$message <- paste0("warning: ",w$message, " (read_shpfiles)")
  }, error = function(e) {e$message <- paste0("error: ",e$message, " (read_shpfiles)")})
  
  return(result)
}