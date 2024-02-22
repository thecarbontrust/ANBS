## ########################################################################################
#' Import the BDMPS spatdist dataset
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the Data Store section holding the dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#' @param spcode Two-letter species code(s)
#'
#' @return A dataframe with with 5 variables: Speccode <chr>, Species <chr>, Population <chr>, Season <chr>,
#'   Area <chr>, Propn.adults <num>, Propn.immatures <num>
#' 
#' @examples
#'   read_bdmpsspatdist()
#'   read_bdmpsspatdist(spcode = c("pu","AC"))
#'  
#' @export

read_bdmpsspatdist <- function(dspathn = file.path("../Data/RawData/BDMPS/704_BDMPSspatdist"),
                               verpathn = "jul2023",
                               dname = "bdmpsspatialdistribution",
                               spcode = c("")) {
  
  result <- tryCatch({
  
    
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"), header=TRUE,
                  blank.lines.skip = TRUE, comment.char = "#", na.strings="empty",
                  sep=",", strip.white=TRUE)
    
    if((!(spcode=="")) & any(names(f) == 'Speccode')) { 
      
      f <- subset(f,toupper(Speccode)==toupper(spcode))
    }
    
    
    
  }, warning = function(w) {w$message <- paste0("BDMPS warning: ",w$message, " (read_bdmpsspatdist)")
  }, error = function(e) {e$message <- paste0("BDMPS error: ",e$message, " (read_bdmpsspatdist)")})
  
  return(result)
}