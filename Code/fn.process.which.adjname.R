## ###################################################################################################################
#' @title Adjust population names for a specific population to align with standard SPA naming format
#' @inheritParams spacode.find
#' @description If `sufficient=TRUE` this function looks at whether `alti` is part of each entry of `pops`; if `sufficient=FALSE` it looks at whether `alti` is exactly equal to each entry of `pops` 
#' @param alti A vector of character values of length one containing the possible alternative population names for the population (`NA` if no alternative name): if multiple names for each population they are separated by a semi-colon followed by a space
#' @param sufficient A logical value: are these alternative names the "minimum sufficient" ones, or another set of alternative names?
#' @return A vector of logical values of length `pops` indicating whether each population is aligned with the name given in `alti` or not
#' @export

which.adjname <- function(alti, pops, sufficient){
  
  out <- rep(FALSE, length(pops))
  
  altnames <- unlist(strsplit(as.character(alti), "; "))
  
  altnames <- fix.punctuation(altnames)
  
  altnames <- spanames.fixformat(altnames)
  
  na <- length(altnames)
  
  for(j in 1:na){
    
    #print(altnames[j])
    
    if(sufficient){
      
      tmp <- rep(FALSE, length(pops))
      
      mm <- grep(altnames[j], pops)
      
      if(length(mm) > 0){ tmp[mm] <- TRUE }
    }
    else{
      
      tmp <- (pops == altnames[j])
    }
    
    out <- out | tmp
  }
  
  out
}