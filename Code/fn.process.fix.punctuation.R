## ###################################################################################################################
## >> fix.punctuation
#' @title Remove punctuation and redundant spaces from a vector of character values
## ########################################################################################
#' @param x A vector of character values
#' ########################################################################################
#' @return A character vector of length `length(x)`
#' ########################################################################################

fix.punctuation <- function(x){
  
  ## Fix "and"
  
  x <- gsub("&", "and", x)
  
  ## Remove apostrophes
  
  x <- gsub("`", "", x) ## added 3 Aug 2021
  
  x <- gsub("'", "", x) ## added 3 Aug 2021
  
  ## Remove blank spaces
  
  x <- gsub("- ", "-", x)
  
  x <- gsub(" -", "-", x)
  
  for(k in 1:5){ x <- gsub("  ", " ", x)}
  
  x
}
