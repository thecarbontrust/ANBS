## ###################################################################################################################
#' @title Basic changes to align population names to align with standard SPA naming format
#' @description This function makes two specific changes: (1) removing the " SPA" that appears at the end of SPA names in some datasets, and (2) changing commas to semi-colons
#' @inheritParams spacode.find
#' @return A vector of character values of length `pops` containing the modified population names
#' @export

spanames.fixformat <- function(pops){
  
  pops <- gsub(" SPA", "", pops)
  
  pops <- gsub(",", ";", pops)
  
  pops
}