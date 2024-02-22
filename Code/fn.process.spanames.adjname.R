## ###################################################################################################################
#' @title Adjust population names to align with standard SPA naming format
#' @inheritParams spacode.find
#' @return A vector of character values of length `pops` containing the modified population names
#' @export

spanames.adjname <- function(pops, spalist, spaaltname){
  
  pops <- as.character(pops)
  
  spaalt <- spalist[,spaaltname]
  
  spaalt <- spaalt[spaalt != ""] ## set of alterations
  
  nm <- length(spaalt) ## number of rows where alterations are needed
  
  for(i in 1:nm){ ## loop over rows where corrections are needed
    
    correctname <- as.character(spalist$SITE_NAME[spaalt[i] == spalist[,spaaltname]])
    
    ww <- which.adjname(alti = spaalt[i], pops = pops, sufficient = (spaaltname == "Altnames.sufficient"))
    
    pops[ww] <- correctname
  }
  
  as.character(pops)
}
