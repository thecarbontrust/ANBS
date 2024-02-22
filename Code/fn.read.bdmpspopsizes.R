## ########################################################################################
#' Import the BDMPS population size file
#'
#' @description This function reads in the comma-separated value data file of population 
#' sizes derived from the Biologically Defined Minimum Population Scales (BDMPS). Can be 
#' filtered for specific species, population types or populations if required. 
#' 
#' @param dspathn Full path to the Data Store section holding the BDMPS popsizes dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#' @param spcode Two-letter species code(s)
#'
#' @return A dataframe with with 5 variables: Species <chr> , Population <chr> , Poptype <chr> , 
#'   Pairs <int>, Most.recent.count <chr> 
#' 
#' @examples
#'    read_bdmpspopsizes()
#'    read_bdmpspopsizes(spcode = c("AC","E."))
#'  
#' @export

read_bdmpspopsizes <- function(dspathn = file.path("../Data/RawData/BDMPS/202_BDMPSpopsizes"),
                               verpathn = "jul2023",
                               dname = "bdmpspopulationsizes",
                               spcode = c("")) {
  
  result <- tryCatch({
    
    # Read in the requested data files (csv)
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"), header=TRUE,
             blank.lines.skip = TRUE, comment.char = "#", na.strings="empty",
             sep=",", strip.white=TRUE, colClasses=c(Most.recent.count="character"))
    
    if((!(spcode=="")) & any(names(f) == 'SHORT_CODE')) { 
      
      f <- subset(f,toupper(SHORT_CODE)==toupper(spcode))
    }
    
    
  }, warning = function(w) {w$message <- paste0("BDMPS warning: ",w$message, " (read_bdmpspopsizes)")
  }, error = function(e) {e$message <- paste0("BDMPS error: ",e$message, " (read_bdmpspopsizes)")})
  
  return(result)
}