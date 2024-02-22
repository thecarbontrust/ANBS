## ########################################################################################
#' Import the SPA name dataset
#'
#' @description This dataset is a list of SPAs that are included in the Cumulative Effects 
#'   Framework (CEF). Variables in the table include SPA primary name plus any codes or 
#'   alternative names used within the CEF.
#' 
#' @param dspathn Full path to the Data associated with this package holding the SPA dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#' @param cefinc Return only SPAs included in the CEF. Logical. 
#'
#' @return A data.frame with with 10 variables: SITE_CODE <chr>, SITE_NAME <chr>, 
#'   CEF.include <chr>, Marine.only <chr>, Altnames.sufficient <chr>, 
#'   Altnames.SPApolys <chr>, Altnames.SMP <chr>, Altnames.Productivity <chr>, 
#'   Altnames.BDMPS <chr>, Altnames.FR <chr>
#' 
#'  
#' @examples
#'    read_spalist()
#'    
#' @export



read_spalist <- function(dspathn = file.path("../Data/RawData/SPA/201_SPAList"),
                         verpathn = "sept2021",
                         dname = "spalist",
                         cefinc = TRUE) {
  
  result <- tryCatch({
    
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"), header=TRUE,
                  blank.lines.skip = TRUE, comment.char = "#", na.strings="empty",
                  sep=",", strip.white=TRUE)
     
    
    if (cefinc){
      f <- subset(f,CEF.include == "Y")
    } else {
      f
    }
    
    
  }, warning = function(w) {w$message <- paste0("read.spalist warning: ",w$message, " (read_spalist)")
  }, error = function(e) {e$message <- paste0("read.spalist error: ",e$message, " (read_spalist)")})
  
  return(result)
  
}