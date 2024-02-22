## ########################################################################################
#' Import the BDMPS 'imprat' dataset
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param dspathn Full path to the Data Store section holding the dataset.
#' @param verpathn Folder name for the required version
#' @param dname Stub name for the dataset (expects to find dname.csv and fields_dname.csv)
#' @param spcode Two-letter code for the seabird species. Leave blank to return all species.
#'
#' @return a dataframe with Speccode <chr> (Species code - two letter BTO code), Species <chr> (full species name), 
#'         Rat <num> (Number of immature birds per breeding pair (i.e. ratio of immature birds to breeding pairs)
#'         If the variable 'Speccode' is not in the imported file, the function will return all of the records in the file, 
#'         regardless of whether spcode has been specified. 
#'  
#' @examples
#'   read_bdmpsimprat()
#'   read_bdmpsimprat(spcode = "GX")
#'  
#' @export

read_bdmpsimprat <- function(dspathn = file.path("../Data/RawData/BDMPS/313_BDMPSimprat"),
                             verpathn = "apr2021",
                             dname = "bdmpsimmaturesratio",
                             spcode = c("")) {
  

    result <- tryCatch({
    
    f <- read.csv(paste0(dspathn, "/",verpathn, "/",dname,".csv"), header=TRUE,
                  blank.lines.skip = TRUE, comment.char = "#", na.strings="empty",
                  sep=",", strip.white=TRUE)
    
    if((!(spcode=="")) & any(names(f) == 'Speccode')) { 
       
       f <- subset(f,toupper(Speccode)==toupper(spcode))
    }
       
  }, warning = function(w) {w$message <- paste0("BDMPS warning: ",w$message, " (read_bdmpsimprat)")
  }, error = function(e) {e$message <- paste0("BDMPS error: ",e$message, " (read_bdmpsimprat)")})
  
  return(result)
}
