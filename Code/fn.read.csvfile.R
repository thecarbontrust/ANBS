## ########################################################################################
#' Generic function to load csv files
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the data holding the dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#'
#' @return dataframe with column names
#'  
#' @export

read_csvfile <- function(dspathn, verpathn, dname){
  
   result <- tryCatch({
    
    
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"))
    
    
  }, warning = function(w) {w$message <- paste0("warning: ",w$message, " (read_csvfile)")
  }, error = function(e) {e$message <- paste0("error: ",e$message, " (read_csvfile)")})
  
  return(result)
}