## ########################################################################################
#' Import the SPA coordinates as used in the CEF
#'
#' @description Some parts of the Cumulative Effects Framework need a point 
#'   location for each colony or SPA and this point must be located in a region 
#'   designated as sea (outside the coastline polygon). As this set of points is
#'   specifically for the CEF, and may differ from other location datasets, the
#'   coordinates are stored as a separate dataset. This function imports the 
#'   dataset. 
#'  
#' @param dspathn Full path to the Data Store section holding dataset.
#' @param verpathn Folder name for the required version
#' @param dname The stub name for the dataset
#' @param sitecode Vector of site codes for the required SPAs
#'
#' @return A dataframe with 23 variables 
#' 
#' @examples
#'   read_spacoords()
#'   read_spacoords(sitecode = c("UK9005012", "UK9001431"))
#'  
#' @export

read_spacoords <- function(dspathn = file.path("../Data/RawData/SPA/207_SPAcoords"),
                           verpathn = "july22",
                           dname = "spacoordinates",
                           sitecode = c("")) {
  
  result <- tryCatch({
    
    
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"), header=TRUE,
                  blank.lines.skip = TRUE, comment.char = "#", na.strings="empty",
                  sep=",", strip.white=TRUE)
   
    
  }, warning = function(w) {w$message <- paste0("SPA warning: ",w$message, " (read_spacoords)")
  }, error = function(e) {e$message <- paste0("SPA error: ",e$message, " (read_spacoords)")})
  
  
  if(any(names(result) == 'SITECODE') & !sitecode[1]=="") { 
    result <- subset(result,SITECODE %in% sitecode)
  } 
  
  return(result)
}
