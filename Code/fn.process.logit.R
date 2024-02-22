## ########################################################################################
#' @title Transform data using a logit function
#' @description 
#' @param x single numeric to be transformed
#' @return single numeric
## ########################################################################################
#' @export 


logit <- function(x){
  
  log(x/(1-x))
  
  }