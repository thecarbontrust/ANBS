## ########################################################################################
#' @title Transform data using an inverse logit function
#' @description 
#' @param y single numeric to be transformed
#' @return single numeric
## ########################################################################################
#' @export 


ilogit <- function(y){
  
  exp(y)/(1+exp(y))
  
  }
